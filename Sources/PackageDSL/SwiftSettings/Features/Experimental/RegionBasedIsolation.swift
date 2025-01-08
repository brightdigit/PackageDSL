
/// Represents a feature based on region-based isolation, as proposed in Swift Evolution Proposal 0414.
public struct RegionBasedIsolation: SwiftSettingFeature {
    /// The state of the feature, which is always `.experimental`.
    public var featureState: FeatureState {
        return .experimental
    }
}
