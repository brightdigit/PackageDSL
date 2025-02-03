/// Passes the flag `-libc`
/// libc runtime library to use
public struct Libc: UnsafeFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }
}
