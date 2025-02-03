/// Passes the flag `-tbd-compatibility-version`
public struct TbdCompatibilityVersion: FrontendFlag {
  public let version: String

  public init(_ version: String) {
    self.version = version
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(version)"]
  }
}
