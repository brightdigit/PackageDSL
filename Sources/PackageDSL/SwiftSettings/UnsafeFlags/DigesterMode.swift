/// Passes the flag `-digester-mode`
/// Uabi
public struct DigesterMode: UnsafeFlag {
  public let api: String

  public init(_ api: String) {
    self.api = api
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(api)"]
  }
}
