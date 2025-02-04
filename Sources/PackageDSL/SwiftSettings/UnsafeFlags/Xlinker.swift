/// Passes the flag `-Xlinker`
///
/// Specifies an option which should be passed to the linker
public struct Xlinker: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
