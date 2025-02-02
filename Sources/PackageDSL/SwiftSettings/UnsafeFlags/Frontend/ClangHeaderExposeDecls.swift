/// Passes the flag `-clang-header-expose-decls=all-public`
public struct ClangHeaderExposeDecls: FrontendFlag {
    public let hasexposeattr: String

    public init(_ hasexposeattr: String) {
        self.hasexposeattr = hasexposeattr
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())=\(hasexposeattr)"]
    }
}
