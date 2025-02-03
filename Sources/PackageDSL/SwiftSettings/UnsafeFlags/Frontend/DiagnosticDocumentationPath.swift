/// Passes the flag `-diagnostic-documentation-path`
public struct DiagnosticDocumentationPath: FrontendFlag {
  public let path: String

  public init(_ path: String) {
    self.path = path
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }
}
