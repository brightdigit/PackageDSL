/// Passes the flag `-access-notes-path`
public struct AccessNotesPath: UnsafeFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }
}
