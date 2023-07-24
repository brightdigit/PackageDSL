

protocol Target: _Depending, Dependency, _Named {}

extension Target {
  var targetDepenency: _PackageDescription_TargetDependency {
    .target(name: self.name)
  }
}
 
