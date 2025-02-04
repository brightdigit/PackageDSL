/// Passes the flag `-trap-function`
///
/// Lower traps to calls to this function instead of trap instructions
public struct TrapFunction: FrontendFlag {
  public let name: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(name)"]
  }

  public init(_ name: String) {
    self.name = name
  }
}
