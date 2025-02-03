/// Passes the flag `-Xclang-linker`
/// Pass <arg> to Clang when it is use for linking.
public struct XclangLinker: UnsafeFlag {
  public let arg: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(arg)"]
  }

  public init(_ arg: String) {
    self.arg = arg
  }
}
