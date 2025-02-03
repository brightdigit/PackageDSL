/// Passes the flag `-unavailable-decl-optimization=<complete,none>`
/// Specify the optimization mode for unavailable declarations. The value may be
/// 'none' (no optimization) or 'complete' (code is not generated at all
/// unavailable declarations)
public struct UnavailableDeclOptimization: UnsafeFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())=\(value)"]
  }
}
