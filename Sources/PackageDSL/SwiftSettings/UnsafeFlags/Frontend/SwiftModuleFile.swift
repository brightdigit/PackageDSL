/// Passes the flag `-swift-module-file=<name>=<path>`
/// Specify Swift module input explicitly built from textual interface
public struct SwiftModuleFile: FrontendFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())=\(value)"]
  }
}
