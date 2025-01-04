
public struct WarnLongFunctionBodies : UnsafeFlag {
  public  init(milliseconds: Int) {
    self.milliseconds = milliseconds
  }
  
  public let milliseconds : Int
  public var unsafeFlagArguments: [String] {
    [
      "-Xfrontend",
      "-warn-long-function-bodies=\(milliseconds)"
    ]
  }
}
