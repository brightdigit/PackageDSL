
/// A struct that represents a warning for long expression type checking.
public struct WarnLongExpressionTypeChecking : UnsafeFlag {
    /// Initializes a new instance of `WarnLongExpressionTypeChecking`.
    /// - Parameter milliseconds: The number of milliseconds to use for the warning threshold.
    public init(milliseconds: Int) {
        self.milliseconds = milliseconds
    }
    
    /// The number of milliseconds to use for the warning threshold.
    public let milliseconds : Int
    
    /// The unsafe flag arguments to be used for the warning.
    public var unsafeFlagArguments: [String] {
        [
            "-Xfrontend",
            "-warn-long-expression-type-checking=\(milliseconds)"
        ]
    }
}
