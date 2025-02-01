/// Passes the flag `-platform-availability-inheritance-map-path`
public struct PlatformAvailabilityInheritanceMapPath: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
