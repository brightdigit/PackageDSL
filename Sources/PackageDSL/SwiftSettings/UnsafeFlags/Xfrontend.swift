/// Passes the flag `-Xfrontend`
///  Pass <arg> to the Swift frontend
public struct Xfrontend: UnsafeFlag {
    public let arg: String

    public init(_ arg: String) {
        self.arg = arg
    }

    public var unsafeFlagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())", "\(arg)"]
    }
}
