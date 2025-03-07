/// Passes the flag `-j`
///
/// Number of commands to execute in parallel
public struct J: UnsafeFlag {
  public let n: Int

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(n)"]
  }

  public init(_ n: Int) {
    self.n = n
  }
}
