/// Passes the flag `-user-module-version`
public struct UserModuleVersion: UnsafeFlag {
    public let vers: String

    public init(_ vers: String) {
        self.vers = vers
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(vers)"]
    }
}
