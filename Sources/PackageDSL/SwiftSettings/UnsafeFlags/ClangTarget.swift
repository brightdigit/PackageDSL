/// Passes the flag `-clang-target`
/// Separately set the target we should use for internal Clang instance
public struct ClangTarget: UnsafeFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }
}
