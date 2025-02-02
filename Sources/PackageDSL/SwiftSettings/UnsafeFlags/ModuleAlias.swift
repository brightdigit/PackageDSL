/// Passes the flag `-module-alias`
public struct ModuleAlias: UnsafeFlag {
    public let alias_name: String

    public init(_ alias_name: String) {
        self.alias_name = alias_name
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(alias_name)"]
    }
}
