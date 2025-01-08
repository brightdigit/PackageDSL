/// A builder for creating collections of `Dependency` instances.
@resultBuilder
public enum DependencyBuilder {
    /// Builds a partial block of dependencies, consisting of a single `Dependency`.
    /// - Parameter first: The first `Dependency` in the block.
    /// - Returns: An array containing the `first` `Dependency`.
    public static func buildPartialBlock(first: Dependency) -> any Dependencies {
        [first]
    }

    /// Builds a partial block of dependencies, adding a new `Dependency` to an existing collection.
    /// - Parameter accumulated: The existing collection of dependencies.
    /// - Parameter next: The new `Dependency` to add to the collection.
    /// - Returns: A new collection of dependencies, containing the accumulated dependencies and the `next` dependency.
    public static func buildPartialBlock(accumulated: any Dependencies, next: Dependency) -> any Dependencies {
        accumulated + [next]
    }
}
