/// Passes the flag `-Rpass-missed=<value>`
///
/// Report missed transformations by optimization passes whose name matches the
/// given POSIX regular expression
public struct RpassMissed: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
