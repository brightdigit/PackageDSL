/// Passes the flag `-interface-compiler-version`
///
public struct InterfaceCompilerVersion: UnsafeFlag {
  public let intcvers: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(intcvers)"]
  }

  public init(_ intcvers: String) {
    self.intcvers = intcvers
  }
}
