/// Passes the flag `-scanner-prefix-map-sdk`
public struct ScannerPrefixMapSdk: UnsafeFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
