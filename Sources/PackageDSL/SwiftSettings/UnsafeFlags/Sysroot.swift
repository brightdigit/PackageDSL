/// Passes the flag `-sysroot`
///
/// Native Platform sysroot
public struct Sysroot: UnsafeFlag {
  public let sysroot: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(sysroot)"]
  }

  public init(_ sysroot: String) {
    self.sysroot = sysroot
  }
}
