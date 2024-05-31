/// Passes the flag `-bad-file-descriptor-retry-count`
public struct BadFileDescriptorRetryCount: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
