///
/// This proposal defines options for the usage of global variables free of data races. Within this proposal, global variables encompass any storage of static duration: `let`s and stored `var`s that are either declared at global scope or as static member variables.
///
/// - SeeAlso: [Strict concurrency for global variables (SE-0412)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0412-strict-concurrency-for-global-variables.md)
///
struct GlobalConcurrency : SwiftSettingFeature {
  /// The current state of the feature.
  var featureState : FeatureState {
    return .upcoming
  }
}
