/// Passes the flag `-digester-mode`
///
/// Abi
public struct DigesterMode: UnsafeFlag {
  public let api: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(api)"]
  }

  public init(_ api: String) {
    self.api = api
  }
}
