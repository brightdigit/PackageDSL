/// A struct that represents a feature in the Swift setting.
public struct DeprecateApplicationMain: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .upcoming
    }
}
