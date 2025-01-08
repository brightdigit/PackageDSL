/// A struct that represents a Swift setting feature related to global concurrency.
public struct GlobalConcurrency: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .upcoming
    }
}
