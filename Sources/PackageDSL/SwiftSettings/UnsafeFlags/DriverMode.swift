/// Passes the flag `--driver-mode=<value>`
///
/// Set the driver mode to either 'swift' or 'swiftc'
public struct DriverMode: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
