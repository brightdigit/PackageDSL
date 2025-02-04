// swiftlint:disable line_length
///
/// Many Swift programs need to interoperate with frameworks written in C/C++/Objective-C whose implementations cannot participate in static data race safety. Similarly, many Swift programs have dependencies that have not yet adopted strict concurrency checking. A `@preconcurrency import` statement downgrades concurrency-related error messages that the programmer cannot resolve because the fundamental issue is in one of the dependencies. To strengthen Swift's data-race safety guarantees while working with preconcurrency dependencies, this proposals adds actor isolation checking at runtime for synchronous isolated functions.
///
/// - SeeAlso: [Dynamic actor isolation enforcement from non-strict-concurrency contexts (SE-0423)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0423-dynamic-actor-isolation.md)
///
public struct DynamicActorIsolation: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .upcoming
  }
}
