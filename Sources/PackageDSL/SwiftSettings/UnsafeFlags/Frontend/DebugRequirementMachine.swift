/// Passes the flag `-debug-requirement-machine=<value>`
///
/// Fine-grained debug output from the generics implementation
public struct DebugRequirementMachine: FrontendFlag {
  public let value: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
