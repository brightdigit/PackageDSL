/// Passes the flag `-driver-filelist-threshold`
public struct DriverFilelistThreshold: UnsafeFlag {
    public let n: Int

    public init(_ n: Int) {
        self.n = n
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(n)"]
    }
}
