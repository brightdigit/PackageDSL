/// Passes the flag `-language-mode`
///
/// Interpret input according to a specific Swift language mode
public struct LanguageMode: FrontendFlag {
  public let mode: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(mode)"]
  }

  public init(_ mode: String) {
    self.mode = mode
  }
}
