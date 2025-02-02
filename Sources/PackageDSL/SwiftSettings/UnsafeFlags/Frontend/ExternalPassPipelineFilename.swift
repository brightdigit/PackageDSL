/// Passes the flag `-external-pass-pipeline-filename`
public struct ExternalPassPipelineFilename: FrontendFlag {
    public let pass_pipeline_file: String

    public init(_ pass_pipeline_file: String) {
        self.pass_pipeline_file = pass_pipeline_file
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(pass_pipeline_file)"]
    }
}
