extension Package {
  convenience init(
    name: String? = nil,
    @ProductsBuilder entries: @escaping () -> [Product]
  ) {
    let packageName : String
    if let name {
      packageName = name
    } else {
      var pathComponents = #filePath.split(separator: "/")
      pathComponents.removeLast()
      packageName = String(pathComponents.last!)
    }
    let entries = entries()
    let products = entries.map(_PackageDescription_Product.entry)
    var targets = entries.flatMap(\.productTargets)
    let dependencies = targets.flatMap { $0.allDependencies() }
    let targetDependencies = dependencies.compactMap { $0 as? Target }
    let packageDependencies = dependencies.compactMap { $0 as? PackageDependencyEntry }
    targets += targetDependencies
    assert(targetDependencies.count + packageDependencies.count == dependencies.count)

    let packgeTargets = Dictionary(grouping: targets, by: { $0.name }).values.compactMap(\.first).map(_PackageDescription_Target.entry(_:))

    let packageDeps = Dictionary(grouping: packageDependencies, by: { $0.productName }).values.compactMap(\.first).map(\.dependency)

    self.init(name: packageName, products: products, dependencies: packageDeps, targets: packgeTargets)
  }
}
 
