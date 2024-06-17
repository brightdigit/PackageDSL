
struct WarnLongFunctionBodies : UnsafeFlag {
  internal init(milliseconds: Int) {
    self.milliseconds = milliseconds
  }
  
  let milliseconds : Int
  var unsafeFlagArguments: [String] {
    [
      "-Xfrontend",
      "-warn-long-function-bodies=\(milliseconds)"
    ]
  }
}
