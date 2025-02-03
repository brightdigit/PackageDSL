/// Passes the flag `-cas-backend-mode=native`
/// Uverify
public struct CasBackendMode: FrontendFlag {
  public let casid: String

  public init(_ casid: String) {
    self.casid = casid
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())=\(casid)"]
  }
}
