/// Passes the flag `-new-driver-path`
///  Path of the new driver to be used
public struct NewDriverPath: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
