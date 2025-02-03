/// Passes the flag `-typo-correction-limit`
public struct TypoCorrectionLimit: UnsafeFlag {
  public let n: Int

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(n)"]
  }

  public init(_ n: Int) {
    self.n = n
  }
}
