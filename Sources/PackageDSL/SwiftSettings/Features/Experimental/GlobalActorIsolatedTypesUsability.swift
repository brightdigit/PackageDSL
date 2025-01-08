/// The `GlobalActorIsolatedTypesUsability` struct represents a feature in the Swift setting.
public struct GlobalActorIsolatedTypesUsability: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .experimental
    }
}
