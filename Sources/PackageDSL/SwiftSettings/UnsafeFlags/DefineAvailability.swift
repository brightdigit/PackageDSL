/// Passes the flag `-define-availability`
public struct DefineAvailability: UnsafeFlag {
    public let macro: String

    public init(_ macro: String) {
        self.macro = macro
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(macro)"]
    }
}
