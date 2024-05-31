/// Passes the flag `-emit-symbol-graph-dir`
public struct EmitSymbolGraphDir: UnsafeFlag {
    public let dir: String

    public init(_ dir: String) {
        self.dir = dir
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(dir)"]
    }
}
