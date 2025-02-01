/// Passes the flag `-require-explicit-availability-target`
public struct RequireExplicitAvailabilityTarget: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
