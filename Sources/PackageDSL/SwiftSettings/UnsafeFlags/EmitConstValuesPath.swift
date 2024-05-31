/// Passes the flag `-emit-const-values-path`
public struct EmitConstValuesPath: UnsafeFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
