// swiftlint:disable line_length
///
/// This proposal changes the Objective-C importing rules such that completion handler parameters are `@Sendable` by default.
///
///
/// - SeeAlso: [Import Objective-C completion handler parameters as `@Sendable` (SE-0463)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0463-sendable-completion-handlers.md)
///
public struct SendableCompletionHandlers: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .experimental
  }
}
