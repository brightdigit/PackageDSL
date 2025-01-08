/// A feature that represents a bitwise copyable type.
public struct BitwiseCopyable: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .experimental
    }
}
