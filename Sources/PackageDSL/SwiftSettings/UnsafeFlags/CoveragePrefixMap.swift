/// Passes the flag `-coverage-prefix-map`
public struct CoveragePrefixMap: UnsafeFlag {
    public let prefix: String

    public init(_ prefix: String) {
        self.prefix = prefix
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(prefix)"]
    }
}
