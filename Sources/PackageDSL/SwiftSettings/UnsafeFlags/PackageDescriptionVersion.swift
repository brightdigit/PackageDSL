/// Passes the flag `-package-description-version`
///
public struct PackageDescriptionVersion: UnsafeFlag {
  public let vers: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(vers)"]
  }

  public init(_ vers: String) {
    self.vers = vers
  }
}
