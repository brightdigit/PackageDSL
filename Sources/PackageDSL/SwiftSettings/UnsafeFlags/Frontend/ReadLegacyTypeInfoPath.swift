/// Passes the flag `-read-legacy-type-info-path=<value>`
///  Read legacy type layout from the given path instead of default path
public struct ReadLegacyTypeInfoPath: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())=\(value)"]
    }
}
