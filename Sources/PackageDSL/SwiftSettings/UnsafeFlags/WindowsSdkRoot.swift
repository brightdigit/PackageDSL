/// Passes the flag `-windows-sdk-root`
public struct WindowsSdkRoot: UnsafeFlag {
  public let root: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(root)"]
  }

  public init(_ root: String) {
    self.root = root
  }
}
