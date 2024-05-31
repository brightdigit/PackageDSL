/// Passes the flag `-placeholder-dependency-module-map-file`
public struct PlaceholderDependencyModuleMapFile: FrontendFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
