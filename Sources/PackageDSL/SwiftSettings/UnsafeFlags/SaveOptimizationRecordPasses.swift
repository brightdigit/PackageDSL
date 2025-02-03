/// Passes the flag `-save-optimization-record-passes`
public struct SaveOptimizationRecordPasses: UnsafeFlag {
  public let regex: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(regex)"]
  }

  public init(_ regex: String) {
    self.regex = regex
  }
}
