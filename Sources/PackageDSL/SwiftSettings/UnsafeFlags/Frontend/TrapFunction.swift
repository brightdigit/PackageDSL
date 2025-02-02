/// Passes the flag `-trap-function`
///  Lower traps to calls to this function instead of trap instructions
public struct TrapFunction: FrontendFlag {
    public let name: String

    public init(_ name: String) {
        self.name = name
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(name)"]
    }
}
