///
/// We propose adding a new type constraint `~Escapable` for types that can be locally copied but cannot be assigned or transferred outside of the immediate context.
/// This complements the `~Copyable` types added with SE-0390 by introducing another set of compile-time-enforced lifetime controls that can be used for safe, highly-performant APIs.
/// In addition, these types will support lifetime-dependency constraints (being tracked in a future proposal), that allow them to safely hold pointers referring to data stored in other types.
/// This feature is a key requirement for the proposed `Span` family of types.
/// **See Also**
/// * [SE-0390: Noncopyable structs and enums](https://github.com/apple/swift-evolution/blob/main/proposals/0390-noncopyable-structs-and-enums.md)
/// * [Language Support for Bufferview](https://forums.swift.org/t/roadmap-language-support-for-bufferview/66211)
/// * [Roadmap for improving Swift performance predictability: ARC improvements and ownership control](https://forums.swift.org/t/a-roadmap-for-improving-swift-performance-predictability-arc-improvements-and-ownership-control/54206)
/// * [Ownership Manifesto](https://forums.swift.org/t/manifesto-ownership/5212)
/// * [Draft Span Proposal](https://github.com/apple/swift-evolution/pull/2307)
/// * [Draft Lifetime Dependency Annotations Proposal](https://github.com/apple/swift-evolution/pull/2305)
///
/// - SeeAlso: [Nonescapable Types (SE-0446)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0446-non-escapable.md)
///
public struct NonescapableTypes : SwiftSettingFeature {
  /// The current state of the feature.
  public var featureState : FeatureState {
    return .upcoming
  }
}
