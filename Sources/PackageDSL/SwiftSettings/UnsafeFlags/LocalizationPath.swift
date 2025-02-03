/// Passes the flag `-localization-path`
public struct LocalizationPath: UnsafeFlag {
  public let path: String

  public init(_ path: String) {
    self.path = path
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }
}
