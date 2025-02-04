/// Passes the flag `-tools-directory`
///
public struct ToolsDirectory: UnsafeFlag {
  public let directory: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(directory)"]
  }

  public init(_ directory: String) {
    self.directory = directory
  }
}
