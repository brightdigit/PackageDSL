/// Passes the flag `-visualc-tools-version`
public struct VisualcToolsVersion: UnsafeFlag {
  public let version: String

  public init(_ version: String) {
    self.version = version
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(version)"]
  }
}
