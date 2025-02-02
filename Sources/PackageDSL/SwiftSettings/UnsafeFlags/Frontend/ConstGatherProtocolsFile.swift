/// Passes the flag `-const-gather-protocols-file`
public struct ConstGatherProtocolsFile: FrontendFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
