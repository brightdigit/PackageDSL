/// Passes the flag `-cas-plugin-path`
///  Path to CAS Plugin
public struct CasPluginPath: UnsafeFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
