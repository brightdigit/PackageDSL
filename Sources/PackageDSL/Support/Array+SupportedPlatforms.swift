extension Array : SupportedPlatforms where Element == _PackageDescription_SupportedPlatform {
  @inlinable init<S>(_ s: S) where Element == S.Element, S : Sequence {
    self.init(s)
  }

  func appending(_ platforms: any SupportedPlatforms) -> Self {
    self + .init(platforms)
  }
}

 
