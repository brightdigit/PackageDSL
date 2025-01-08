/// A protocol that represents a sequence of `TestTarget` elements.
public protocol TestTargets: Sequence where Element == any TestTarget {
    /// Initializes a `TestTargets` instance from a sequence of `TestTarget` elements.
    /// - Parameter s: A sequence of `TestTarget` elements.
    init<S>(_ s: S) where S.Element == any TestTarget, S: Sequence
    
    /// Appends a sequence of `TestTarget` elements to the current `TestTargets` instance.
    /// - Parameter testTargets: A sequence of `TestTarget` elements to append.
    /// - Returns: A new `TestTargets` instance with the additional `TestTarget` elements.
    func appending(_ testTargets: any TestTargets) -> Self
}
