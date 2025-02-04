/// Passes the flag `-driver-filelist-threshold`
///
public struct DriverFilelistThreshold: UnsafeFlag {
  public let n: Int

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(n)"]
  }

  public init(_ n: Int) {
    self.n = n
  }
}
