//
// Package+Extensions.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

public extension Package {
  convenience init(
    name: String? = nil,
    @ProductsBuilder entries: @escaping () -> [any Product],
    @TestTargetBuilder testTargets: @escaping () -> any TestTargets = { [any TestTarget]() },
    @SwiftSettingsBuilder swiftSettings: @escaping () -> [SwiftSetting] = { [SwiftSetting]() }
  ) {
    let packageName: String
    if let name {
      packageName = name
    } else {
      var pathComponents = #filePath.split(separator: "/")
      pathComponents.removeLast()
      // swiftlint:disable:next force_unwrapping
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
    let packageDependencies = dependencies.compactMap { $0 as? PackageDependency }
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
      grouping: packageDependencies,
      by: { $0.packageName }
    ).values.compactMap(\.first).map(\.dependency)

    self.init(name: packageName, products: products, dependencies: packageDeps, targets: packgeTargets)
  }
}

public extension Package {
  func supportedPlatforms(
    @SupportedPlatformBuilder supportedPlatforms: @escaping () -> any SupportedPlatforms
  ) -> Package {
    self.platforms = .init(supportedPlatforms())
    return self
  }

  func defaultLocalization(_ defaultLocalization: LanguageTag) -> Package {
    self.defaultLocalization = defaultLocalization
    return self
  }
}
