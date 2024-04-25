// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0429-partial-consumption.md
struct MoveOnlyPartialConsumption : SwiftSettingFeature {
  var featureState : FeatureState {
    return .experimental
  }
}
