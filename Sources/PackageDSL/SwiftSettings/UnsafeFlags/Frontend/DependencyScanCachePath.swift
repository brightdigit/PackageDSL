/// Passes the flag `-dependency-scan-cache-path`
///
public struct DependencyScanCachePath: FrontendFlag {
  public let value: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
