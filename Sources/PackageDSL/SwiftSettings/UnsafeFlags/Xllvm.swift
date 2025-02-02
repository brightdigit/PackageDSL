/// Passes the flag `-Xllvm`
///  Pass <arg> to LLVM.
public struct Xllvm: UnsafeFlag {
    public let arg: String

    public init(_ arg: String) {
        self.arg = arg
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(arg)"]
    }
}
