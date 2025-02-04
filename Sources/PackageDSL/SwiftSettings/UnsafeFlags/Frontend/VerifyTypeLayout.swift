/// Passes the flag `-verify-type-layout`
///
public struct VerifyTypeLayout: FrontendFlag {
  public let type: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(type)"]
  }

  public init(_ type: String) {
    self.type = type
  }
}
