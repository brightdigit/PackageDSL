/// Passes the flag `-clang-scanner-module-cache-path`
///
public struct ClangScannerModuleCachePath: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
