//
// Package+Extensions.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

extension Package {
  static var defaultName: String {
    var pathComponents = #filePath.split(separator: "/")
    pathComponents.removeLast()
    // swift-format-ignore: NeverForceUnwrap
    // swiftlint:disable:next force_unwrapping
    return String(pathComponents.last!)
  }

  /// Initializes a new `Package` instance with the provided properties.
  /// - Parameters:
  ///   - name: The name of the package.
  ///   If `nil`, the name will be inferred from the file path.
  ///   - entries: A closure that returns an array of `Product` instances.
  ///   - packageDependencies: A closure that returns an array
  ///   of `PackageDependency` instances.
  ///   - testTargets: A closure that returns an array of `TestTarget` instances.
  ///   - swiftSettings: A closure that returns an array of `SwiftSetting` instances.
  public convenience init(
    name: String? = nil,
    @ProductsBuilder entries: @escaping () -> [any Product],
    @PackageDependencyBuilder dependencies packageDependencies: @escaping () ->
      [any PackageDependency] = { [any PackageDependency]() },
    @TestTargetBuilder testTargets:
      @escaping () -> any TestTargets = { [any TestTarget]() },
    @SwiftSettingsBuilder swiftSettings:
      @escaping () -> [SwiftSetting] = { [SwiftSetting]() }
  ) {
    let packageName = name ?? Self.defaultName
    let allTestTargets = testTargets()
    let entries = entries()
    let products = entries.map(_PackageDescription_Product.entry)
    let targets = entries.flatMap(\.productTargets)
    let swiftSettings = swiftSettings()
    let packageDeps = Self.dependencies(
      packageDependencies(),
      targets,
      .init(allTestTargets),
      swiftSettings: swiftSettings
    )
    let packgeTargets = Self.targets(
      targets,
      .init(allTestTargets),
      swiftSettings: swiftSettings
    )
    self.init(
      name: packageName,
      products: products,
      dependencies: packageDeps,
      targets: packgeTargets
    )
  }

  static func dependencies(
    _ packageDependencies: [any PackageDependency],
    _ targetSets: [_Depending & _Named]...,
    swiftSettings: [SwiftSetting] = []
  ) -> [Package.Dependency] {
    let dependencies = targetSets.flatMap {
      $0.flatMap {
        $0.allDependencies()
      }
    }
    let packageTargetDependencies = dependencies.compactMap { $0 as? TargetDependency }
    let allPackageDependencies =
      packageTargetDependencies.map(\.package) + packageDependencies
    let packageDeps = Dictionary(
      grouping: allPackageDependencies
    ) { $0.packageName }
    .values.compactMap(\.first).map(\.dependency)
    return packageDeps
  }

  static func targets(
    _ targetSets: [any Target]...,
    swiftSettings: [SwiftSetting] = []
  ) -> [_PackageDescription_Target] {
    // var targets = entries.flatMap(\.productTargets)
    let targets = targetSets.flatMap {
      $0.flatMap {
        [$0] + $0.allDependencies().compactMap { $0 as? Target }
      }
    }
    return Dictionary(
      grouping: targets
    ) { $0.name }
    .values
    .compactMap(\.first)
    .map { _PackageDescription_Target.entry($0, swiftSettings: swiftSettings) }
  }
}

extension Package {
  /// Adds supported platforms to the package.
  /// - Parameter supportedPlatforms: A closure that returns
  /// an array of `SupportedPlatforms` instances.
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
