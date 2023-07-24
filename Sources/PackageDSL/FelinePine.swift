import PackageDescription

struct FelinePine: PackageDependencyEntry {
  var dependency: Package.Dependency {
    .package(url: "https://github.com/brightdigit/FelinePine.git", from: "0.1.0-alpha.3")
  }
}
 
