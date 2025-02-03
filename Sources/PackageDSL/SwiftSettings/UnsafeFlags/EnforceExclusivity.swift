/// Passes the flag `-enforce-exclusivity=<enforcement>`
/// Enforce law of exclusivity
public struct EnforceExclusivity: UnsafeFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())=\(value)"]
  }
}
