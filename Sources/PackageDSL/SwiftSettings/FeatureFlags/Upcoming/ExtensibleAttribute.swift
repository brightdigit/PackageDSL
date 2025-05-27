// swiftlint:disable line_length
///
/// This proposal provides developers the capabilities to mark public enums in
/// non-resilient Swift libraries as extensible.
///
///  This makes Swift `enum`s vastly
/// more useful in public API of such libraries.
///
/// - SeeAlso: [Extensible enums (SE-0487)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0487-extensible-enums.md)
///
public struct ExtensibleAttribute: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .upcoming
  }
}
