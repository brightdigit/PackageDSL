/// A struct that represents a Swift setting feature.
public struct InferSendableFromCaptures: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .upcoming
    }
}
