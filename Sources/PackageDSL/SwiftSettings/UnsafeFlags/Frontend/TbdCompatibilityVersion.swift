/// Passes the flag `-tbd-compatibility-version`
public struct TbdCompatibilityVersion: FrontendFlag {
  public let version: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(version)"]
  }

  public init(_ version: String) {
    self.version = version
  }
}
