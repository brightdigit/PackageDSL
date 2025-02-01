/// Passes the flag `-clang-header-expose-decls=all-public`
public struct ClangHeaderExposeDecls: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())=\(value)"]
    }
}
