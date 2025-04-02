/// Passes the flag `-Werror`
///
public struct Werror: UnsafeFlag {
  public let diagnosticgroup: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(diagnosticgroup)"]
  }

  public init(_ diagnosticgroup: String) {
    self.diagnosticgroup = diagnosticgroup
  }
}
