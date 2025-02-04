/// Passes the flag `-entry-point-function-name`
public struct EntryPointFunctionName: FrontendFlag {
  public let string: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(string)"]
  }

  public init(_ string: String) {
    self.string = string
  }
}
