/// Passes the flag `-library-level`
/// Library distribution level 'api', 'spi' or 'other' (the default)
public struct LibraryLevel: UnsafeFlag {
  public let level: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(level)"]
  }

  public init(_ level: String) {
    self.level = level
  }
}
