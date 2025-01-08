
/// A result builder for creating a list of `PackageDependency` values.
@resultBuilder
public enum PackageDependencyBuilder {
    /// Builds a partial result block from a single `PackageDependency` value.
    ///
    /// - Parameter first: The first `PackageDependency` value.
    /// - Returns: An array containing the first `PackageDependency` value.
    public static func buildPartialBlock(first: PackageDependency) -> [any PackageDependency] {
        [first]
    }

    /// Builds a partial result block from an accumulated array of `PackageDependency` values and a new `PackageDependency` value.
    ///
    /// - Parameters:
    ///   - accumulated: The accumulated array of `PackageDependency` values.
    ///   - next: The new `PackageDependency` value to add to the array.
    /// - Returns: The updated array of `PackageDependency` values.
    public static func buildPartialBlock(accumulated: [any PackageDependency], next: PackageDependency) -> [any PackageDependency] {
        accumulated + [next]
    }
}
