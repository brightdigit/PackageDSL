/// Passes the flag `-batch-scan-input-file`
public struct BatchScanInputFile: FrontendFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
