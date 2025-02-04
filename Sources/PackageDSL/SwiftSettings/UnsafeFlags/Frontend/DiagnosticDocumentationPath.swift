/// Passes the flag `-diagnostic-documentation-path`
///
public struct DiagnosticDocumentationPath: FrontendFlag {
  public let path: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }

  public init(_ path: String) {
    self.path = path
  }
}
