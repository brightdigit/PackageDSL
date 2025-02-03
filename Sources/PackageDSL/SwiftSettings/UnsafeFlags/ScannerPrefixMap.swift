/// Passes the flag `-scanner-prefix-map`
public struct ScannerPrefixMap: UnsafeFlag {
  public let prefix: String

  public init(_ prefix: String) {
    self.prefix = prefix
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(prefix)"]
  }
}
