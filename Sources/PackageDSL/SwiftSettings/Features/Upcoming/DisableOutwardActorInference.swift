/// A type that disables outward actor inference.
public struct DisableOutwardActorInference: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .upcoming
    }
}
