/// Passes the flag `-enforce-exclusivity=<enforcement>`
/// Enforce law of exclusivity
public struct EnforceExclusivity: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
