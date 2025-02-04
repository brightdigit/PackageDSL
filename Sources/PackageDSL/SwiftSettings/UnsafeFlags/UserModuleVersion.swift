/// Passes the flag `-user-module-version`
///
public struct UserModuleVersion: UnsafeFlag {
  public let vers: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(vers)"]
  }

  public init(_ vers: String) {
    self.vers = vers
  }
}
