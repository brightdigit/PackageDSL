/// Passes the flag `-Wwarning`
///
public struct Wwarning: UnsafeFlag {
  public let diagnosticgroup: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(diagnosticgroup)"]
  }

  public init(_ diagnosticgroup: String) {
    self.diagnosticgroup = diagnosticgroup
  }
}
