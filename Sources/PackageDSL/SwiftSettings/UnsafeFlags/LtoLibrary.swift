/// Passes the flag `-lto-library`
///
public struct LtoLibrary: UnsafeFlag {
  public let ltolibrary: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(ltolibrary)"]
  }

  public init(_ ltolibrary: String) {
    self.ltolibrary = ltolibrary
  }
}
