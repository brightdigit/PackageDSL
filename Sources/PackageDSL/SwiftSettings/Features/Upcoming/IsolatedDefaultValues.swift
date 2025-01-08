/// An isolated default values feature that conforms to the `SwiftSettingFeature` protocol.
public struct IsolatedDefaultValues: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .upcoming
    }
}
