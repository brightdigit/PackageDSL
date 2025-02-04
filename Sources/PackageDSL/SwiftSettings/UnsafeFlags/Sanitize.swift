/// Passes the flag `-sanitize=<check>`
/// Turn on runtime checks for erroneous behavior.
public struct Sanitize: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
