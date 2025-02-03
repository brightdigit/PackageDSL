/// Passes the flag `-clang-include-tree-root`
public struct ClangIncludeTreeRoot: FrontendFlag {
  public let casid: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(casid)"]
  }

  public init(_ casid: String) {
    self.casid = casid
  }
}
