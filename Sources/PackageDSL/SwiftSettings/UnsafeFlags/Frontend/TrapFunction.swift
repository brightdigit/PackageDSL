/// Passes the flag `-trap-function`
///  Lower traps to calls to this function instead of trap instructions
public struct TrapFunction: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
