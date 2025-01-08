
/// A struct that represents a warning flag for long function bodies.
public struct WarnLongFunctionBodies: UnsafeFlag {
    /// Initializes a new instance of `WarnLongFunctionBodies`.
    /// - Parameter milliseconds: The threshold in milliseconds for the compiler to warn about long function bodies.
    public init(milliseconds: Int) {
        self.milliseconds = milliseconds
    }

    /// The threshold in milliseconds for the compiler to warn about long function bodies.
    public let milliseconds: Int

    /// The command-line arguments to be passed to the compiler to enable the warning.
    public var unsafeFlagArguments: [String] {
        [
            "-Xfrontend",
            "-warn-long-function-bodies=\(milliseconds)"
        ]
    }
}
