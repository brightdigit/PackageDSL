/// Passes the flag `-tools-directory`
public struct ToolsDirectory: UnsafeFlag {
    public let directory: String

    public init(_ directory: String) {
        self.directory = directory
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(directory)"]
    }
}
