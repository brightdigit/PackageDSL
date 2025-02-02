/// Passes the flag `-o`
///  Write output to <file>
public struct O: UnsafeFlag {
    public let file: String

    public init(_ file: String) {
        self.file = file
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(file)"]
    }
}
