// swiftlint:disable line_length
///
/// This proposal is focused on a few corner cases in the language surrounding functions as values and key path literals when using concurrency.
///
///  We propose Sendability should be inferred for partial and unapplied methods. We also propose to lift a Sendability restriction placed on key path literals in [SE-0302](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0302-concurrent-value-and-concurrent-closures.md#key-path-literals) by allowing the developers to control whether key path literal is Sendable or not. The goal is to improve flexibility, simplicity, and ergonomics without significant changes to Swift.
///
/// - SeeAlso: [Inferring `Sendable` for methods and key path literals (SE-0418)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0418-inferring-sendable-for-methods.md)
///
public struct InferSendableFromCaptures: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .upcoming
  }
}
