/// Passes the flag `-windows-sdk-version`
public struct WindowsSdkVersion: UnsafeFlag {
    public let version: String

    public init(_ version: String) {
        self.version = version
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(version)"]
    }
}
