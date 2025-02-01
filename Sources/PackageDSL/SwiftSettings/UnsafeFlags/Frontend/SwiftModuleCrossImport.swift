/// Passes the flag `-swift-module-cross-import`
///  <crossImport.swiftoverlay>
public struct SwiftModuleCrossImport: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
