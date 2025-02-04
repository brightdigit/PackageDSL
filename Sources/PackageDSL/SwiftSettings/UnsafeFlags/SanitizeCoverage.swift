/// Passes the flag `-sanitize-coverage=<type>`
///
/// Specify the type of coverage instrumentation for Sanitizers and additional
/// options separated by commas
public struct SanitizeCoverage: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
