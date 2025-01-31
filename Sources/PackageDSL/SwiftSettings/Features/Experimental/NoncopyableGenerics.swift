///
/// The noncopyable types introduced in
/// [SE-0390: Noncopyable structs and enums](0390-noncopyable-structs-and-enums.md)
/// cannot be used with generics, protocols, or existentials,
/// leaving an expressivity gap in the language. This proposal extends Swift's
/// type system to fill this gap.
///
/// - SeeAlso: [Noncopyable Generics (SE-0427)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0427-noncopyable-generics.md)
///
struct NoncopyableGenerics : SwiftSettingFeature {
  /// The current state of the feature.
  var featureState : FeatureState {
    return .experimental
  }
}
