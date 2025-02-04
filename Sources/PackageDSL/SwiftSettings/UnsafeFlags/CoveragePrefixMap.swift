/// Passes the flag `-coverage-prefix-map`
///
public struct CoveragePrefixMap: UnsafeFlag {
  public let prefix: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(prefix)"]
  }

  public init(_ prefix: String) {
    self.prefix = prefix
  }
}
