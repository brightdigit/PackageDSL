/// Passes the flag `-entry-point-function-name`
public struct EntryPointFunctionName: FrontendFlag {
    public let string: String

    public init(_ string: String) {
        self.string = string
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(string)"]
    }
}
