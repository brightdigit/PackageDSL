/// Passes the flag `-Xcc`
///  Pass <arg> to the C/C++/Objective-C compiler
public struct Xcc: UnsafeFlag {
    public let arg: String

    public init(_ arg: String) {
        self.arg = arg
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(arg)"]
    }
}
