/// Passes the flag `-sdk`
///
/// Compile against <sdk>
public struct Sdk: UnsafeFlag {
  public let sdk: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(sdk)"]
  }

  public init(_ sdk: String) {
    self.sdk = sdk
  }
}
