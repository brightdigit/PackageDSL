// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0429-partial-consumption.md
public struct MoveOnlyPartialConsumption : SwiftSettingFeature {
  public var featureState : FeatureState {
    return .experimental
  }
}
