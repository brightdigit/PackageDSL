/// Passes the flag `-visualc-tools-version`
public struct VisualcToolsVersion: UnsafeFlag {
  public let version: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(version)"]
  }

  public init(_ version: String) {
    self.version = version
  }
}
