/// Passes the flag `-dump-ast-format`
///
public struct DumpAstFormat: UnsafeFlag {
  public let format: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(format)"]
  }

  public init(_ format: String) {
    self.format = format
  }
}
