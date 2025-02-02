/// Passes the flag `-target`
///  Generate code for the given target <triple>, such as x86_64-apple-macos10.9
public struct TargetFlag: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
