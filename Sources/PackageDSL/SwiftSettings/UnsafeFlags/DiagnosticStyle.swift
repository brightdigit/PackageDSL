/// Passes the flag `-diagnostic-style`
///
public struct DiagnosticStyle: UnsafeFlag {
  public let style: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(style)"]
  }

  public init(_ style: String) {
    self.style = style
  }
}
