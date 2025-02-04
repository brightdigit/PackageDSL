/// Passes the flag `-assert-config`
///
/// Specify the assert_configuration replacement. Possible values are Debug,
/// Release, Unchecked, DisableReplacement.
public struct AssertConfig: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
