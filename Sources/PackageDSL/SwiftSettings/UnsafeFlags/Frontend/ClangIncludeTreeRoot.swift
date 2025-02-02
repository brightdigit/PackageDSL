/// Passes the flag `-clang-include-tree-root`
public struct ClangIncludeTreeRoot: FrontendFlag {
    public let casid: String

    public init(_ casid: String) {
        self.casid = casid
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(casid)"]
    }
}
