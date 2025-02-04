/// Passes the flag `-requirement-machine-max-split-concrete-equiv-class-attempts=<value>`
/// Set the maximum concrete number of attempts at splitting concrete equivalence
/// classes before giving up. There should never be a reason to change this
public struct RequirementMachineMaxSplitConcreteEquivClassAttempts: FrontendFlag {
  public let value: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
