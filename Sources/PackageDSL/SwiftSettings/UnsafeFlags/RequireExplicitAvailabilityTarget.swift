/// Passes the flag `-require-explicit-availability-target`
public struct RequireExplicitAvailabilityTarget: UnsafeFlag {
  public let target: String

  public init(_ target: String) {
    self.target = target
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(target)"]
  }
}
