/// Passes the flag `-target-sdk-name`
public struct TargetSdkName: FrontendFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }
}
