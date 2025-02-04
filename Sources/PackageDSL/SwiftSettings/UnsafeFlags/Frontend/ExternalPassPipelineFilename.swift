/// Passes the flag `-external-pass-pipeline-filename`
public struct ExternalPassPipelineFilename: FrontendFlag {
  public let passpipelinefile: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(passpipelinefile)"]
  }

  public init(_ passpipelinefile: String) {
    self.passpipelinefile = passpipelinefile
  }
}
