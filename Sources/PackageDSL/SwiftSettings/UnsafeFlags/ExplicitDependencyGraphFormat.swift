/// Passes the flag `-explicit-dependency-graph-format=<value>`
///  Specify the explicit dependency graph output format to either 'json' or 'dot'
public struct ExplicitDependencyGraphFormat: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())=\(value)"]
    }
}
