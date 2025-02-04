/// Passes the flag `-tbd-current-version`
///
public struct TbdCurrentVersion: FrontendFlag {
  public let version: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(version)"]
  }

  public init(_ version: String) {
    self.version = version
  }
}
