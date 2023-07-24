
protocol Dependencies : Sequence where Element == Dependency {
  init<S>(_ s: S) where S.Element == Dependency, S : Sequence
  func appending(_ dependencies: any Dependencies) -> Self
}
 
