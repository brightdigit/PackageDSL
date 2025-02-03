/// Passes the flag `-requirement-machine-max-rule-length=<value>`
/// Set the maximum rule length before giving up
public struct RequirementMachineMaxRuleLength: FrontendFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())=\(value)"]
  }
}
