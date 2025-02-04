/// Passes the flag `-require-explicit-availability-target`
///
public struct RequireExplicitAvailabilityTarget: UnsafeFlag {
  public let target: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(target)"]
  }

  public init(_ target: String) {
    self.target = target
  }
}
