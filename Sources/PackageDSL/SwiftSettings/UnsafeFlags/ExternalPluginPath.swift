/// Passes the flag `-external-plugin-path`
public struct ExternalPluginPath: UnsafeFlag {
  public let path: String

  public init(_ path: String) {
    self.path = path
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }
}
