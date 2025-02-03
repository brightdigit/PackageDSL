/// Passes the flag `-cas-plugin-option`
public struct CasPluginOption: UnsafeFlag {
  public let name: String

  public init(_ name: String) {
    self.name = name
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(name)"]
  }
}
