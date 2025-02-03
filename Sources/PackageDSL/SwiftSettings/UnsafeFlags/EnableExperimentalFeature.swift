/// Passes the flag `-enable-experimental-feature`
public struct EnableExperimentalFeature: UnsafeFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }
}
