///
/// Default value expressions are permitted for default arguments and default stored property values. There are several issues with the current actor isolation rules for default value expressions: the rules for stored properties admit data races, the rules for default argument values are overly restrictive, and the rules between the different places you can use default value expressions are inconsistent with each other, making the actor isolation model harder to understand. This proposal unifies the actor isolation rules for default value expressions, eliminates data races, and improves expressivity by safely allowing isolation for default values.
///
/// - SeeAlso: [Isolated default value expressions (SE-0411)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0411-isolated-default-values.md)
///
public struct IsolatedDefaultValues : SwiftSettingFeature {
  /// The current state of the feature.
  public var featureState : FeatureState {
    return .upcoming
  }
}
