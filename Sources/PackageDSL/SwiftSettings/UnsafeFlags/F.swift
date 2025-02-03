/// Passes the flag `-F`
/// Add directory to framework search path
public struct F: UnsafeFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }
}
