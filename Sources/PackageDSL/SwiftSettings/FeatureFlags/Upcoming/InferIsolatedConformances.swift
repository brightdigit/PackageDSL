// swiftlint:disable line_length
///
/// Types isolated to a global actor (such as `@MainActor`) are useful for representing data that can only ever be used from a single concurrency context.
///
///  They occur both in single-threaded programs where all code is expected to run on the main actor as well as larger applications where interaction with the UI occurs through the main actor. Unfortunately, such types are unable to conform to most protocols due to isolation mismatches:
/// ```swift
/// @MainActor
/// class MyModelType: Equatable {
///   var name: String
///   init(name: String) {
///     self.name = name
///   }
///   // error: main-actor-isolated static function '==' cannot satisfy non-isolated requirement 'Equatable.=='
///   static func ==(lhs: MyModelType, rhs: MyModelType) -> Bool {
///     lhs.name == rhs.name
///   }
/// }
/// ```
/// This proposal introduces the notion of an *isolated conformance*, which is a conformance that can only be used within the isolation domain of the type. For the code above, the conformance to `Equatable` can be specified as being isolated to the main actor as follows:
/// ```swift
/// @MainActor
/// class MyModelType: @MainActor Equatable {
///   // unchanged from the above ...
/// }
/// ```
/// This allows `MyModelType` to provide a conformance to `Equatable` that works like every other conformance, except that it can only be used from the main actor.
///
/// - SeeAlso: [Global-actor isolated conformances (SE-0470)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0470-isolated-conformances.md)
///
public struct InferIsolatedConformances: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .upcoming
  }
}
