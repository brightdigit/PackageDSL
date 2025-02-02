/// Passes the flag `-typo-correction-limit`
public struct TypoCorrectionLimit: UnsafeFlag {
    public let n: Int

    public init(_ n: Int) {
        self.n = n
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(n)"]
    }
}
