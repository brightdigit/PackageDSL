/// Passes the flag `-Xcc`
///  Pass <arg> to the C/C++/Objective-C compiler
public struct Xcc: UnsafeFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(value)"]
    }
}
