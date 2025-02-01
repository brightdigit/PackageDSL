/// Passes the flag `-emit-abi-descriptor-path`
public struct EmitAbiDescriptorPath: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
