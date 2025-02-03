/// Passes the flag `-debug-prefix-map`
public struct DebugPrefixMap: UnsafeFlag {
  public let prefix: String

  public init(_ prefix: String) {
    self.prefix = prefix
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(prefix)"]
  }
}
