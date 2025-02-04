/// Passes the flag `-lto=<value>`
///
/// Specify the LTO type to either 'llvm-thin' or 'llvm-full'
public struct Lto: UnsafeFlag {
  public let value: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
