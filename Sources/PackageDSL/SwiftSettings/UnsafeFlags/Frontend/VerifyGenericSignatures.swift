/// Passes the flag `-verify-generic-signatures`
public struct VerifyGenericSignatures: FrontendFlag {
  public let modulename: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(modulename)"]
  }

  public init(_ modulename: String) {
    self.modulename = modulename
  }
}
