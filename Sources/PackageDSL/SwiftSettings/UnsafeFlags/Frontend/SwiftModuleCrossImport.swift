/// Passes the flag `-swift-module-cross-import`
///  <crossImport.swiftoverlay>
public struct SwiftModuleCrossImport: FrontendFlag {
    public let modulename: String

    public init(_ modulename: String) {
        self.modulename = modulename
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(modulename)"]
    }
}
