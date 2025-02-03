/// Passes the flag `-tbd-install_name`
public struct TbdInstallName: FrontendFlag {
  public let path: String

  public init(_ path: String) {
    self.path = path
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }
}
