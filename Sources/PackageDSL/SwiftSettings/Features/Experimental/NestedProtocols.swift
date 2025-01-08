/// Represents a nested protocol feature in Swift.
public struct NestedProtocols: SwiftSettingFeature {
    
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .experimental
    }
}
