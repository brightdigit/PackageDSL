/// Passes the flag `-cas-backend-mode=native`
///
/// Verify
public struct CasBackendMode: FrontendFlag {
  public let casid: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(casid)"]
  }

  public init(_ casid: String) {
    self.casid = casid
  }
}
