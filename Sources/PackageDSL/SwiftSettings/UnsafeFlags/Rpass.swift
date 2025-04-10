/// Passes the flag `-Rpass=<value>`
///
/// Report performed transformations by optimization passes whose name matches the
/// given POSIX regular expression
public struct Rpass: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
