/// Passes the flag `-cas-fs`
///  Root CASID for CAS FileSystem
public struct CasFs: FrontendFlag {
    public let casid: String

    public init(_ casid: String) {
        self.casid = casid
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(casid)"]
    }
}
