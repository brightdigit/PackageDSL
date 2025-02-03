/// Passes the flag `-sil-inline-threshold`
public struct SilInlineThreshold: FrontendFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }
}
