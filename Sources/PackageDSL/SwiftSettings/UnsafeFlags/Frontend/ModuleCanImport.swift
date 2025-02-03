/// Passes the flag `-module-can-import`
public struct ModuleCanImport: FrontendFlag {
  public let modulename: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(modulename)"]
  }

  public init(_ modulename: String) {
    self.modulename = modulename
  }
}
