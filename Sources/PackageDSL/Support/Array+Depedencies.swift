

extension Array : Dependencies where Element == Dependency {
  @inlinable init<S>(_ s: S) where Element == S.Element, S : Sequence {
    self.init(s)
  }

  func appending(_ dependencies: any Dependencies) -> Array<Dependency> {
    self + dependencies
  }
}

 
