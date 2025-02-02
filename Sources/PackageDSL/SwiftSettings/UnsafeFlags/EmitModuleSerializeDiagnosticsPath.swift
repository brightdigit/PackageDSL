/// Passes the flag `-emit-module-serialize-diagnostics-path`
public struct EmitModuleSerializeDiagnosticsPath: UnsafeFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
