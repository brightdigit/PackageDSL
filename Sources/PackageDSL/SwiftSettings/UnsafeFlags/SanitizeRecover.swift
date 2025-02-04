/// Passes the flag `-sanitize-recover=<check>`
///
/// Specify which sanitizer runtime checks (see -sanitize=) will generate
/// instrumentation that allows error recovery. Listed checks should be comma
/// separated. Default behavior is to not allow error recovery.
public struct SanitizeRecover: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
