
/// Extension for `Array` where the `Element` is any `TestTarget`.
extension Array: TestTargets where Element == any TestTarget {
  /// Appends the given `TestTargets` to the current array.
  ///
  /// - Parameter testTargets: The `TestTargets` to append to the array.
  /// - Returns: A new array containing the elements of the current array plus the elements of the `testTargets`.
  public func appending(_ testTargets: any TestTargets) -> [any TestTarget] {
    self + testTargets
  }
}
