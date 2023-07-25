//
// Package+Extensions.swift
// Copyright (c) 2023 BrightDigit.
//

extension Package {
  convenience init(
    name: String? = nil,
    @ProductsBuilder entries: @escaping () -> [Product],
    @TestTargetBuilder testTargets: @escaping () -> any TestTargets = { [TestTarget]() }
  ) {
    let packageName: String
    if let name {
      packageName = name
    } else {
      var pathComponents = #filePath.split(separator: "/")
      pathComponents.removeLast()
      packageName = String(pathComponents.last!)
    }
    let allTestTargets = testTargets()
    let entries = entries()
    let products = entries.map(_PackageDescription_Product.entry)
    var targets = entries.flatMap(\.productTargets)
    let dependencies = targets.flatMap { $0.allDependencies() } + allTestTargets.flatMap { $0.allDependencies() }
    let targetDependencies = dependencies.compactMap { $0 as? Target }
    let packageDependencies = dependencies.compactMap { $0 as? PackageDependency }
    targets += targetDependencies
    targets += allTestTargets.map { $0 as Target }
    assert(targetDependencies.count + packageDependencies.count == dependencies.count)

    let packgeTargets = Dictionary(grouping: targets, by: { $0.name }).values.compactMap(\.first).map(_PackageDescription_Target.entry(_:))

    let packageDeps = Dictionary(grouping: packageDependencies, by: { $0.productName }).values.compactMap(\.first).map(\.dependency)

    self.init(name: packageName, products: products, dependencies: packageDeps, targets: packgeTargets)
  }
}

extension Package {
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
