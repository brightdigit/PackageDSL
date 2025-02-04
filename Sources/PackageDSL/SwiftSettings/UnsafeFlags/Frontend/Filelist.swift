/// Passes the flag `-filelist`
///
/// Specify source inputs in a file rather than on the command line
public struct Filelist: FrontendFlag {
  public let value: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
