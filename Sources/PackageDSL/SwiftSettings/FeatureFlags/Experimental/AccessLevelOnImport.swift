// swiftlint:disable line_length
///
/// Declaring the visibility of a dependency with an access-level modifier on import declarations enables enforcing which declarations can reference the imported module.
///
/// A dependency can be marked as being visible only to the source file, module, package, or to all clients.
/// This brings the familiar behavior of the access level of declarations to dependencies and imported declarations.
/// This feature can hide implementation details from clients and helps to manage dependency creep.
///
/// - SeeAlso: [Access-level modifiers on import declarations (SE-0409)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0409-access-level-on-imports.md)
///
public struct AccessLevelOnImport: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .experimental
  }
}
