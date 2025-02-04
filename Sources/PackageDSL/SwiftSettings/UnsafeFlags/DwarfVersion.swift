/// Passes the flag `-dwarf-version=<version>`
/// DWARF debug info version to produce if requested
public struct DwarfVersion: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
