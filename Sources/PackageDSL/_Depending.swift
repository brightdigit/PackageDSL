
// swift-format-ignore: NoLeadingUnderscores
/// A protocol that represents an entity that has dependencies.
public protocol _Depending {
    /// The dependencies of the entity.
    @DependencyBuilder
    var dependencies: any Dependencies { get }
}

extension _Depending {
    /// The default implementation of the `dependencies` property.
    public var dependencies: any Dependencies {
        [Dependency]()
    }
}

extension _Depending {
    /// Retrieves all the dependencies of the entity, including nested dependencies.
    ///
    /// - Returns: An array of all the dependencies of the entity.
    public func allDependencies() -> [Dependency] {
        dependencies.compactMap {
            $0 as? _Depending
        }
        .flatMap {
            $0.allDependencies()
        }
        .appending(dependencies)
    }
}
