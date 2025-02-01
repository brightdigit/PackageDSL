/// Passes the flag `-emit-tbd-path`
///  Emit the TBD file to <path>
public struct EmitTbdPath: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
