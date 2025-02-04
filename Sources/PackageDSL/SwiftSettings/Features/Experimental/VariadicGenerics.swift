// swiftlint:disable line_length
///
/// Building upon the **Value and Type Parameter Packs** proposal [SE-0393](https://forums.swift.org/t/se-0393-value-and-type-parameter-packs/63859), this proposal enables referencing a tuple value that contains a value pack inside a pack repetition pattern.
///
/// - SeeAlso: [Tuple of value pack expansion (SE-0399)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0399-tuple-of-value-pack-expansion.md)
///
public struct VariadicGenerics: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .experimental
  }
}
