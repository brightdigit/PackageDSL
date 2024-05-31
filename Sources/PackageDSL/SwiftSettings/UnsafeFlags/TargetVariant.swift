/// Passes the flag `-target-variant`
///  Generate 'zippered' code for macCatalyst that can run on the specified variant target triple in addition to the main -target triple
public struct TargetVariant: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
