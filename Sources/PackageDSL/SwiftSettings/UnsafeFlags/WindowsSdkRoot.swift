/// Passes the flag `-windows-sdk-root`
public struct WindowsSdkRoot: UnsafeFlag {
    public let root: String

    public init(_ root: String) {
        self.root = root
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(root)"]
    }
}
