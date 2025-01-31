///
/// Swift Concurrency assigns values to *isolation domains* determined by actor and
/// task boundaries. Code running in distinct isolation domains can execute
/// concurrently, and `Sendable` checking defines away concurrent access to
/// shared mutable state by preventing non-`Sendable` values from being passed
/// across isolation boundaries full stop. In practice, this is a significant
/// semantic restriction, because it forbids natural programming patterns that are
/// free of data races.
/// In this document, we propose loosening these rules by introducing a
/// new control flow sensitive diagnostic that determines whether a non-`Sendable`
/// value can safely be transferred over an isolation boundary. This is done by
/// introducing the concept of *isolation regions* that allows the compiler to
/// reason conservatively if two values can affect each other. Through the usage of
/// isolation regions, the language can prove that transferring a non-`Sendable`
/// value over an isolation boundary cannot result in races because the value (and
/// any other value that might reference it) is not used in the caller after the
/// point of transfer.
///
/// - SeeAlso: [Region based Isolation (SE-0414)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0414-region-based-isolation.md)
///
struct RegionBasedIsolation : SwiftSettingFeature {
  /// The current state of the feature.
  var featureState : FeatureState {
    return .upcoming
  }
}
