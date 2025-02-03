/// Passes the flag `-emit-digester-baseline-path`
public struct EmitDigesterBaselinePath: UnsafeFlag {
  public let path: String

  public init(_ path: String) {
    self.path = path
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }
}
