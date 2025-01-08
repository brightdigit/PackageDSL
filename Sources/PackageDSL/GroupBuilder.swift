/// A builder for creating groups of elements.
@resultBuilder
public enum GroupBuilder<U> {
    /// Builds a partial block of the group by combining the accumulated elements with the output of the next `GroupBuildable` element.
    /// - Parameters:
    ///   - accumulated: The accumulated elements in the group.
    ///   - next: The next `GroupBuildable` element to add to the group.
    /// - Returns: The updated group of elements.
    public static func buildPartialBlock<T: GroupBuildable>(accumulated: [U], next: T) -> [U] where T.Output == U {
        accumulated + T.output(from: [next])
    }

    /// Builds a partial block of the group with the output of the first `GroupBuildable` element.
    /// - Parameter first: The first `GroupBuildable` element to add to the group.
    /// - Returns: The group of elements.
    public static func buildPartialBlock<T: GroupBuildable>(first: T) -> [U] where T.Output == U {
        T.output(from: [first])
    }
}
