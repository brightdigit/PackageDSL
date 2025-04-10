// swiftlint:disable line_length
///
/// We propose the introduction of two new accessors, `yielding mutate` and `yielding borrow`, for implementing computed properties and subscripts alongside the current `get` and `set`.
///
/// By contrast with `get` and `set`, whose bodies behave like traditional methods, the body of a `yielding` accessor will be a coroutine, using a new contextual keyword `yield` to pause the coroutine and lend access of a value to the caller.
/// When the caller ends its access to the lent value, the coroutine's execution will continue after `yield`.
/// These `yielding` accessors enable values to be accessed and modified without requiring a copy.
/// This is essential for noncopyable types and often desirable for performance even with copyable types.
/// This feature has been available (but not supported) since Swift 5.0 via the `_modify` and `_read` keywords.
/// Additionally, the feature is available via `read` and `modify` on recent builds from the compiler's `main` branch using the flag `-enable-experimental-feature CoroutineAccessors`.
///
/// - SeeAlso: [Yielding accessors (SE-0474)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0474-yielding-accessors.md)
///
public struct CoroutineAccessors: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .experimental
  }
}
