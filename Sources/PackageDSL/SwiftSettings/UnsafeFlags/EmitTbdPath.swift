/// Passes the flag `-emit-tbd-path`
/// Emit the TBD file to <path>
public struct EmitTbdPath: UnsafeFlag {
  public let path: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }

  public init(_ path: String) {
    self.path = path
  }
}
