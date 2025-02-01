/// Passes the flag `-library-level`
///  Library distribution level 'api', 'spi' or 'other' (the default)
public struct LibraryLevel: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
