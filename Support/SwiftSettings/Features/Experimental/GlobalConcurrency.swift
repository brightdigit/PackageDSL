// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0412-strict-concurrency-for-global-variables.md
struct GlobalConcurrency : SwiftSettingFeature {
  var featureState : FeatureState {
    return .experimental
  }
}
