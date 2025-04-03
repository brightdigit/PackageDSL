/// Passes the flag `-profile-sample-use=<profile`
///
/// Data>
public struct ProfileSampleUse: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
