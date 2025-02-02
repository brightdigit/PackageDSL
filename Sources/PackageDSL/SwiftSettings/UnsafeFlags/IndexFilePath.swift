/// Passes the flag `-index-file-path`
///  Produce index data for file <path>
public struct IndexFilePath: UnsafeFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
