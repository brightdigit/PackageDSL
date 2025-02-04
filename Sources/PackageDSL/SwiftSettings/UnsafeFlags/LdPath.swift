/// Passes the flag `-ld-path=<value>`
/// Specifies the path to the linker to be used
public struct LdPath: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
