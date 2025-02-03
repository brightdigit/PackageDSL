/// Passes the flag `-swift-version`
/// Interpret input according to a specific Swift language version number
public struct SwiftVersion: UnsafeFlag {
  public let vers: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(vers)"]
  }

  public init(_ vers: String) {
    self.vers = vers
  }
}
