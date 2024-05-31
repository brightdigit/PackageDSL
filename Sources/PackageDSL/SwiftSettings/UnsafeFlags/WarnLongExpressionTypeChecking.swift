
struct WarnLongExpressionTypeChecking : UnsafeFlag {
  internal init(milliseconds: Int) {
    self.milliseconds = milliseconds
  }
  
  let milliseconds : Int
  var unsafeFlagArguments: [String] {
    [
      "-Xfrontend",
      "-warn-long-expression-type-checking=\(milliseconds)"
    ]
  }
}
