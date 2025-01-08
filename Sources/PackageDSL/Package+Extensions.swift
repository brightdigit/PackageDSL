
//
// Package+Extensions.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

extension Package {
  /// Initializes a new `Package` instance with the provided properties.
  /// - Parameters:
  ///   - name: The name of the package. If `nil`, the name will be inferred from the file path.
  ///   - entries: A closure that returns an array of `Product` instances.
  ///   - packageDependencies: A closure that returns an array of `PackageDependency` instances.
  ///   - testTargets: A closure that returns an array of `TestTarget` instances.
  ///   - swiftSettings: A closure that returns an array of `SwiftSetting` instances.
  public convenience init(
    name: String? = nil,
    @ProductsBuilder entries: @escaping () -> [any Product],
    @PackageDependencyBuilder dependencies packageDependencies: @escaping () -> [any PackageDependency] = { [any PackageDependency]() },
    @TestTargetBuilder testTargets: @escaping () -> any TestTargets = { [any TestTarget]() },
    @SwiftSettingsBuilder swiftSettings: @escaping () -> [SwiftSetting] = { [SwiftSetting]() }
  ) {
    let packageName: String
    if let name {
      packageName = name
    } else {
      var pathComponents = #filePath.split(separator: "/")
      pathComponents.removeLast()
      // swift-format-ignore: NeverForceUnwrap
      packageName = String(pathComponents.last!)
    }
    let allTestTargets = testTargets()
    let entries = entries()
    let products = entries.map(_PackageDescription_Product.entry)
    var targets = entries.flatMap(\.productTargets)
    let allTargetsDependencies = targets.flatMap { $0.allDependencies() }
    let allTestTargetsDependencies = allTestTargets.flatMap { $0.allDependencies() }
    let dependencies = allTargetsDependencies + allTestTargetsDependencies
    let targetDependencies = dependencies.compactMap { $0 as? Target }
    let packageTargetDependencies = dependencies.compactMap { $0 as? TargetDependency }
    let allPackageDependencies = packageTargetDependencies.map(\.package) + packageDependencies()
    targets += targetDependencies
    targets += allTestTargets.map { $0 as Target }
    let packgeTargets = Dictionary(
      grouping: targets,
      by: { $0.name }
    )
    .values
    .compactMap(\.first)
    .map { _PackageDescription_Target.entry($0, swiftSettings: swiftSettings()) }
    let packageDeps = Dictionary(
      grouping: allPackageDependencies,
      by: { $0.packageName }
    )
    .values.compactMap(\.first).map(\.dependency)
    self.init(
      name: packageName,
      products: products,
      dependencies: packageDeps,
      targets: packgeTargets
    )
  }
}

extension Package {
  /// Adds supported platforms to the package.
  /// - Parameter supportedPlatforms: A closure that returns an array of `SupportedPlatforms` instances.
  /// - Returns: The modified `Package` instance.
  public func supportedPlatforms(
    @SupportedPlatformBuilder supportedPlatforms: @escaping () -> any SupportedPlatforms
  ) -> Package {
    platforms = .init(supportedPlatforms())
    return self
  }

  /// Sets the default localization for the package.
  /// - Parameter defaultLocalization: The default localization for the package.
  /// - Returns: The modified `Package` instance.
  public func defaultLocalization(_ defaultLocalization: LanguageTag) -> Package {
    self.defaultLocalization = defaultLocalization
    return self
  }
}
