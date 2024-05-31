/// Passes the flag `-use-ld=<value>`
/// Specifies the flavor of the linker to be used
public struct UseLd: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())=\(value)"]
    }
}
