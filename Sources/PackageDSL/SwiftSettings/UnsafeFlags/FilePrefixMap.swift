/// Passes the flag `-file-prefix-map`
public struct FilePrefixMap: UnsafeFlag {
  public let prefix: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(prefix)"]
  }

  public init(_ prefix: String) {
    self.prefix = prefix
  }
}
