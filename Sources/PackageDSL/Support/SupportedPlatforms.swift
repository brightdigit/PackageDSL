

protocol SupportedPlatforms : Sequence where Element == _PackageDescription_SupportedPlatform {
  init<S>(_ s: S) where S.Element == _PackageDescription_SupportedPlatform, S : Sequence
  func appending(_ platforms: any SupportedPlatforms) -> Self
}

 
