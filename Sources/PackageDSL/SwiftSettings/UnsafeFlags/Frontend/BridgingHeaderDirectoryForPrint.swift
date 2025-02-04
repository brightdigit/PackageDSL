/// Passes the flag `-bridging-header-directory-for-print`
///
public struct BridgingHeaderDirectoryForPrint: FrontendFlag {
  public let path: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }

  public init(_ path: String) {
    self.path = path
  }
}
