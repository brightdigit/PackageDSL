/// Passes the flag `-Xclang-linker`
///  Pass <arg> to Clang when it is use for linking.
public struct XclangLinker: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
