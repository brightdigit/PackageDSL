/// Passes the flag `-pch-output-dir`
///
/// Directory to persist automatically created precompiled bridging headers
public struct PchOutputDir: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
