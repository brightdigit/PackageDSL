/// Passes the flag `-debug-info-format=<value>`
/// Specify the debug info format type to either 'dwarf' or 'codeview'
public struct DebugInfoFormat: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
