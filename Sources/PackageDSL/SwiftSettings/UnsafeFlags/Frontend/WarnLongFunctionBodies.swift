/// Passes the flag `-warn-long-function-bodies`
///
public struct WarnLongFunctionBodies: FrontendFlag {
  public let n: Int

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(n)"]
  }

  public init(_ n: Int) {
    self.n = n
  }
}
