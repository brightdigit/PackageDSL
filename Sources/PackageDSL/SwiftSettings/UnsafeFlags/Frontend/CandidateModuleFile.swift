/// Passes the flag `-candidate-module-file`
///
public struct CandidateModuleFile: FrontendFlag {
  public let path: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }

  public init(_ path: String) {
    self.path = path
  }
}
