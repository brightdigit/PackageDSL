/// Passes the flag `-cxx-interoperability-mode=<value>`
///
/// Enables C++ interoperability; pass 'default' to enable or 'off' to disable
public struct CxxInteroperabilityMode: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
