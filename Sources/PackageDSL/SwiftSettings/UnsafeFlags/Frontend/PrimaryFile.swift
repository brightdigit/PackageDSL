/// Passes the flag `-primary-file`
///
/// Produce output for this file, not the whole module
public struct PrimaryFile: FrontendFlag {
  public let value: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
