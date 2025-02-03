/// Passes the flag `-allowable-client`
public struct AllowableClient: UnsafeFlag {
  public let vers: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(vers)"]
  }

  public init(_ vers: String) {
    self.vers = vers
  }
}
