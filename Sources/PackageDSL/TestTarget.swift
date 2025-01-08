/// A protocol that represents a test target.
public protocol TestTarget: Target, GroupBuildable {}

extension TestTarget {
    /// The target type for this target.
    public var targetType: TargetType {
        .test
    }
}
