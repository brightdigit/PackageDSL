/// Passes the flag `-load-resolved-plugin`
///
public struct LoadResolvedPlugin: UnsafeFlag {
  public let librarypath: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(librarypath)"]
  }

  public init(_ librarypath: String) {
    self.librarypath = librarypath
  }
}
