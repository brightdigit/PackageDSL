/// Passes the flag `-profile-use=<profdata>`
/// Supply a profdata file to enable profile-guided optimization
public struct ProfileUse: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())=\(value)"]
    }
}
