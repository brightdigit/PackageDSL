/// Passes the flag `-emit-objc-header-path`
public struct EmitObjcHeaderPath: UnsafeFlag {
  public let path: String

  public init(_ path: String) {
    self.path = path
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }
}
