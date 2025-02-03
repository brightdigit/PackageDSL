/// Passes the flag `-emit-dependencies-path`
public struct EmitDependenciesPath: FrontendFlag {
  public let path: String

  public init(_ path: String) {
    self.path = path
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }
}
