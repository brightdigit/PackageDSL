/// Passes the flag `-cas-path`
/// Path to CAS
public struct CasPath: UnsafeFlag {
  public let path: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }

  public init(_ path: String) {
    self.path = path
  }
}
