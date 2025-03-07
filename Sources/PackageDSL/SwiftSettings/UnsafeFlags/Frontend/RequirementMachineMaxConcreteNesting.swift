/// Passes the flag `-requirement-machine-max-concrete-nesting=<value>`
///
/// Set the maximum concrete type nesting depth before giving up
public struct RequirementMachineMaxConcreteNesting: FrontendFlag {
  public let value: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
