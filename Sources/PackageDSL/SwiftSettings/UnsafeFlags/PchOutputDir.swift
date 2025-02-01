/// Passes the flag `-pch-output-dir`
///  Directory to persist automatically created precompiled bridging headers
public struct PchOutputDir: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
