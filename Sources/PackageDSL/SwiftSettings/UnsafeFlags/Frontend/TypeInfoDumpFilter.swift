/// Passes the flag `-type-info-dump-filter=<value>`
///
/// One of 'all', 'resilient' or 'fragile'
public struct TypeInfoDumpFilter: FrontendFlag {
  public let value: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
