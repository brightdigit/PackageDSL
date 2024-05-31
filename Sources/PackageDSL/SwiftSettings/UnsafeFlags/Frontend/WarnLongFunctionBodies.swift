/// Passes the flag `-warn-long-function-bodies`
public struct WarnLongFunctionBodies: FrontendFlag {
    public let n: Int

    public init(_ n: Int) {
        self.n = n
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(n)"]
    }
}
