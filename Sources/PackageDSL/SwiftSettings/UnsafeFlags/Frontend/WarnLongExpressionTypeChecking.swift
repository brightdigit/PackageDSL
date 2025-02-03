/// Passes the flag `-warn-long-expression-type-checking`
public struct WarnLongExpressionTypeChecking: FrontendFlag {
  public let n: Int

  public init(_ n: Int) {
    self.n = n
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(n)"]
  }
}
