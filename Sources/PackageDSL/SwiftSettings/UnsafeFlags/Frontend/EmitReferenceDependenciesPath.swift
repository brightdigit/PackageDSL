/// Passes the flag `-emit-reference-dependencies-path`
public struct EmitReferenceDependenciesPath: FrontendFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
