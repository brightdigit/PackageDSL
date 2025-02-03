/// Passes the flag `-previous-module-installname-map-file`
public struct PreviousModuleInstallnameMapFile: FrontendFlag {
  public let path: String

  public init(_ path: String) {
    self.path = path
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }
}
