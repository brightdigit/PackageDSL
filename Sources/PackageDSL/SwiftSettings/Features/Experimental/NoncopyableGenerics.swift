
/// A struct that represents a non-copyable generic feature.
public struct NoncopyableGenerics: SwiftSettingFeature {
    /// The feature state of the `NoncopyableGenerics` struct.
    public var featureState: FeatureState {
        return .experimental
    }
}
