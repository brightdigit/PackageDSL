/// Passes the flag `-clang-include-tree-filelist`
///
public struct ClangIncludeTreeFilelist: FrontendFlag {
  public let casid: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(casid)"]
  }

  public init(_ casid: String) {
    self.casid = casid
  }
}
