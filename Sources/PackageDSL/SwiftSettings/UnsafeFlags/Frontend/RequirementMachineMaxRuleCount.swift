/// Passes the flag `-requirement-machine-max-rule-count=<value>`
/// Set the maximum number of rules before giving up
public struct RequirementMachineMaxRuleCount: FrontendFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())=\(value)"]
  }
}
