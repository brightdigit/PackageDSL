/// Passes the flag `-dwarf-version=<version>`
///  DWARF debug info version to produce if requested
public struct DwarfVersion: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())=\(value)"]
    }
}
