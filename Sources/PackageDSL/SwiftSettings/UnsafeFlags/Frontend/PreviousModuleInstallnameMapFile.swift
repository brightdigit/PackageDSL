/// Passes the flag `-previous-module-installname-map-file`
public struct PreviousModuleInstallnameMapFile: FrontendFlag {
  public let path: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }

  public init(_ path: String) {
    self.path = path
  }
}
