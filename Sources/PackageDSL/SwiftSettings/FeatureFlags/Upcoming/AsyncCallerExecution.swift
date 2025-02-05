// swiftlint:disable line_length
///
/// Swift's general philosophy is to prioritize safety and ease-of-use over
/// performance, while still providing tools to write more efficient code.
///
///  The
/// current behavior of nonisolated async functions prioritizes main actor
/// responsiveness at the expense of usability.
/// This proposal changes the behavior of nonisolated async functions to run on
/// the caller's actor by default, and introduces an explicit way to state that an
/// async function always switches off of an actor to run.
///
/// - SeeAlso: [Run nonisolated async functions on the caller's actor by default (SE-0461)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0461-async-function-isolation.md)
///
public struct AsyncCallerExecution: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .upcoming
  }
}
