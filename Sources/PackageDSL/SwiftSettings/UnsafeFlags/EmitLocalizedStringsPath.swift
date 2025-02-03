/// Passes the flag `-emit-localized-strings-path`
public struct EmitLocalizedStringsPath: UnsafeFlag {
  public let path: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }

  public init(_ path: String) {
    self.path = path
  }
}
