
public struct WarnLongExpressionTypeChecking : UnsafeFlag {
  public  init(milliseconds: Int) {
    self.milliseconds = milliseconds
  }
  
  public let milliseconds : Int
  public var unsafeFlagArguments: [String] {
    [
      "-Xfrontend",
      "-warn-long-expression-type-checking=\(milliseconds)"
    ]
  }
}
