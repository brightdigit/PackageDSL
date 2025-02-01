/// Passes the flag `-module-can-import-version`
///  <version> <underlyingVersion>
public struct ModuleCanImportVersion: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
