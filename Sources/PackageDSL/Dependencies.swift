/// A protocol that represents a collection of `Dependency` elements.
public protocol Dependencies: Sequence where Element == Dependency {
  /// Initializes a `Dependencies` instance from a sequence of `Dependency` elements.
  /// - Parameter sequence: A sequence of `Dependency` elements.
  init<S>(_ sequence: S) where S.Element == Dependency, S: Sequence

  /// Appends the provided `Dependencies` to the current `Array` of `Dependency` elements.
  ///
  /// - Parameter dependencies: The `Dependencies` to be appended.
  /// - Returns: A new array containing the original elements and the appended items.
  func appending(_ dependencies: any Dependencies) -> Self
}
