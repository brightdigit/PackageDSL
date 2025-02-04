/// Passes the flag `-debug-prefix-map`
public struct DebugPrefixMap: UnsafeFlag {
  public let prefix: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(prefix)"]
  }

  public init(_ prefix: String) {
    self.prefix = prefix
  }
}
