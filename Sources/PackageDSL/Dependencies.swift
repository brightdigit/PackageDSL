
/// A protocol that represents a collection of `Dependency` elements.
public protocol Dependencies: Sequence where Element == Dependency {
    /// Initializes a `Dependencies` instance from a sequence of `Dependency` elements.
    /// - Parameter s: A sequence of `Dependency` elements.
    init<S>(_ s: S) where S.Element == Dependency, S: Sequence
    
    /// Creates a new `Dependencies` instance by appending the provided `Dependencies` to the existing `Dependencies`.
    /// - Parameter dependencies: The `Dependencies` to append.
    /// - Returns: A new `Dependencies` instance that includes the existing `Dependencies` and the provided `Dependencies`.
    func appending(_ dependencies: any Dependencies) -> Self
}
