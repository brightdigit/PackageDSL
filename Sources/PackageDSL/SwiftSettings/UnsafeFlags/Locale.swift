/// Passes the flag `-locale`
///
/// Choose a language for diagnostic messages
public struct Locale: UnsafeFlag {
  public let localecode: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(localecode)"]
  }

  public init(_ localecode: String) {
    self.localecode = localecode
  }
}
