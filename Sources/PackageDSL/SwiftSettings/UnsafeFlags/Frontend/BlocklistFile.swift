/// Passes the flag `-blocklist-file`
/// The path to a blocklist configuration file
public struct BlocklistFile: FrontendFlag {
  public let path: String

  public init(_ path: String) {
    self.path = path
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }
}
