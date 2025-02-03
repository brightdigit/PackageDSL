/// Passes the flag `-target`
/// Generate code for the given target <triple>, such as x86_64-apple-macos10.9
public struct TargetFlag: UnsafeFlag {
  public let triple: String

  public init(_ triple: String) {
    self.triple = triple
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(triple)"]
  }
}
