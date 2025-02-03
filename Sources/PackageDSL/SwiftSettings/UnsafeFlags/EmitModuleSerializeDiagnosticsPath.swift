/// Passes the flag `-emit-module-serialize-diagnostics-path`
public struct EmitModuleSerializeDiagnosticsPath: UnsafeFlag {
  public let path: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }

  public init(_ path: String) {
    self.path = path
  }
}
