/// Passes the flag `-visualc-tools-root`
public struct VisualcToolsRoot: UnsafeFlag {
  public let root: String

  public init(_ root: String) {
    self.root = root
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(root)"]
  }
}
