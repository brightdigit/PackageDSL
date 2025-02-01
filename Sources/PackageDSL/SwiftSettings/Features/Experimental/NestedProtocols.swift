///
/// Allows protocols to be nested in non-generic `struct/class/enum/actor`s, and functions.
///
/// - SeeAlso: [Allow Protocols to be Nested in Non-Generic Contexts (SE-0404)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0404-nested-protocols.md)
///
public struct NestedProtocols : SwiftSettingFeature {
  /// The current state of the feature.
  public var featureState : FeatureState {
    return .experimental
  }
}
