/// Passes the flag `-gcc-toolchain`
///  Specify a directory where the clang importer and clang linker can find headers and libraries
public struct GccToolchain: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
