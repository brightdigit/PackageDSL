// swiftlint:disable line_length
///
/// `@UIApplicationMain` and `@NSApplicationMain` used to be the standard way for
/// iOS and macOS apps respectively to declare a synthesized platform-specific
/// entrypoint for an app.
///
///  These functions have since been obsoleted by
/// [SE-0281](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0281-main-attribute.md)'s
/// introduction of the `@main` attribute, and they now represent a confusing bit of
/// duplication in the language. This proposal seeks to deprecate these alternative
/// entrypoint attributes in favor of `@main` in pre-Swift 6, and it makes their use
/// in Swift 6 a hard error.
///
/// - SeeAlso: [Deprecate @UIApplicationMain and @NSApplicationMain (SE-0383)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0383-deprecate-uiapplicationmain-and-nsapplicationmain.md)
///
public struct DeprecateApplicationMain: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .upcoming
  }
}
