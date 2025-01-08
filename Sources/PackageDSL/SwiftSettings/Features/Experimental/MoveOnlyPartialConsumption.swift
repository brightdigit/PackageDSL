

/// A struct representing a move-only partial consumption feature from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0429-partial-consumption.md
public struct MoveOnlyPartialConsumption: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .experimental
    }
}
