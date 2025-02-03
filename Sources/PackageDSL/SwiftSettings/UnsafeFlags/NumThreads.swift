/// Passes the flag `-num-threads`
/// Enable multi-threading and specify number of threads
public struct NumThreads: UnsafeFlag {
  public let n: Int

  public init(_ n: Int) {
    self.n = n
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(n)"]
  }
}
