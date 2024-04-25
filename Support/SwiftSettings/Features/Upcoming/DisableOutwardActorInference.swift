// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0401-remove-property-wrapper-isolation.md
struct DisableOutwardActorInference : SwiftSettingFeature {
  var featureState : FeatureState {
    return .upcoming
  }
}
