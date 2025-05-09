/// Passes the flag `-experimental-platform-c-calling-convention`
///
public struct ExperimentalPlatformCCallingConvention: FrontendFlag {
  public let value: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
