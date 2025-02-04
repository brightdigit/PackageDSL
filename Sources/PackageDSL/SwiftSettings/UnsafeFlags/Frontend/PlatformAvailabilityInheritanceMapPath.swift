/// Passes the flag `-platform-availability-inheritance-map-path`
public struct PlatformAvailabilityInheritanceMapPath: FrontendFlag {
  public let path: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(path)"]
  }

  public init(_ path: String) {
    self.path = path
  }
}
