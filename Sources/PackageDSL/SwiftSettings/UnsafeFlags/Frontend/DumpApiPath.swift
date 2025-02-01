/// Passes the flag `-dump-api-path`
///  The path to output swift interface files for the compiled source files
public struct DumpApiPath: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
