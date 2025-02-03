/// Passes the flag `-sil-unroll-threshold`
public struct SilUnrollThreshold: FrontendFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }
}
