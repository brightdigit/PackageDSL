/// Passes the flag `-tbd-current-version`
public struct TbdCurrentVersion: FrontendFlag {
  public let version: String

  public init(_ version: String) {
    self.version = version
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(version)"]
  }
}
