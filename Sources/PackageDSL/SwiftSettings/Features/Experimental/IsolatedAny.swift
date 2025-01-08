
/// A type-erased wrapper around any type that can be safely passed between isolated contexts.
public struct IsolatedAny: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .experimental
    }
}
