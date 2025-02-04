/// Passes the flag `-cache-replay-prefix-map`
///
public struct CacheReplayPrefixMap: FrontendFlag {
  public let prefix: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(prefix)"]
  }

  public init(_ prefix: String) {
    self.prefix = prefix
  }
}
