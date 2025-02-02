/// Passes the flag `-emit-fixits-path`
public struct EmitFixitsPath: FrontendFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
