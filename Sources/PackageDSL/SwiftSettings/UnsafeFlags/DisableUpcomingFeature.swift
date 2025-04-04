/// Passes the flag `-disable-upcoming-feature`
///
public struct DisableUpcomingFeature: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
