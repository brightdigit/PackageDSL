/// Passes the flag `-dump-scope-maps`
public struct DumpScopeMaps: UnsafeFlag {
  public let expandedorlistofline: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(expandedorlistofline)"]
  }

  public init(_ expandedorlistofline: String) {
    self.expandedorlistofline = expandedorlistofline
  }
}
