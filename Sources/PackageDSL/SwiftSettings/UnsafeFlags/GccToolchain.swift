/// Passes the flag `-gcc-toolchain`
///  Specify a directory where the clang importer and clang linker can find headers and libraries
public struct GccToolchain: UnsafeFlag {
    public let path: String

    public init(_ path: String) {
        self.path = path
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(path)"]
    }
}
