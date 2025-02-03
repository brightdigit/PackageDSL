/// Passes the flag `-debug-constraints-on-line`
public struct DebugConstraintsOnLine: FrontendFlag {
  public let line: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(line)"]
  }

  public init(_ line: String) {
    self.line = line
  }
}
