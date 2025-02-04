/// Passes the flag `-serialized-path-obfuscate`
public struct SerializedPathObfuscate: FrontendFlag {
  public let prefix: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(prefix)"]
  }

  public init(_ prefix: String) {
    self.prefix = prefix
  }
}
