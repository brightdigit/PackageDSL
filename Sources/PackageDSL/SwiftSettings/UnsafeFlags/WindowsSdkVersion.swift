/// Passes the flag `-windows-sdk-version`
public struct WindowsSdkVersion: UnsafeFlag {
  public let version: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(version)"]
  }

  public init(_ version: String) {
    self.version = version
  }
}
