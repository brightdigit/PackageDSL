/// Passes the flag `-clang-header-expose-module`
public struct ClangHeaderExposeModule: FrontendFlag {
  public let importedmodulename: String

  public init(_ importedmodulename: String) {
    self.importedmodulename = importedmodulename
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(importedmodulename)"]
  }
}
