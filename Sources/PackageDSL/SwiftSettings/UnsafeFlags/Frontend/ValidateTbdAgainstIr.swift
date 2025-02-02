/// Passes the flag `-validate-tbd-against-ir=<level>`
///  Compare the symbols in the IR against the TBD file that would be generated.
public struct ValidateTbdAgainstIr: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())=\(value)"]
    }
}
