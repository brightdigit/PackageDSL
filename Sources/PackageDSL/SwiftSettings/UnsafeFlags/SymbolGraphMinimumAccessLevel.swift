/// Passes the flag `-symbol-graph-minimum-access-level`
public struct SymbolGraphMinimumAccessLevel: UnsafeFlag {
    public let level: String

    public init(_ level: String) {
        self.level = level
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(level)"]
    }
}
