/// Passes the flag `-debug-requirement-machine=<value>`
/// Fine-grained debug output from the generics implementation
public struct DebugRequirementMachine: FrontendFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())=\(value)"]
  }
}
