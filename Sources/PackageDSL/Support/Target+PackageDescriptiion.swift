

extension _PackageDescription_Target {
  static func entry(_ entry: Target) -> _PackageDescription_Target {
    let dependencies = entry.dependencies.map(\.targetDepenency)
    return .target(name: entry.name, dependencies: dependencies)
  }
}
 
