/// Passes the flag `-external-pass-pipeline-filename`
public struct ExternalPassPipelineFilename: FrontendFlag {
  public let passpipelinefile: String

  public init(_ passpipelinefile: String) {
    self.passpipelinefile = passpipelinefile
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(passpipelinefile)"]
  }
}
