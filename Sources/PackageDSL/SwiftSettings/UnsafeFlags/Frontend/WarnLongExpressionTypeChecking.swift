/// Passes the flag `-warn-long-expression-type-checking`
public struct WarnLongExpressionTypeChecking: FrontendFlag {
  public let n: Int

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(n)"]
  }

  public init(_ n: Int) {
    self.n = n
  }
}
