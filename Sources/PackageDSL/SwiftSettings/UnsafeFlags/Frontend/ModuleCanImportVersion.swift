/// Passes the flag `-module-can-import-version`
/// <version> <underlyingVersion>
public struct ModuleCanImportVersion: FrontendFlag {
  public let modulename: String

  public init(_ modulename: String) {
    self.modulename = modulename
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(modulename)"]
  }
}
