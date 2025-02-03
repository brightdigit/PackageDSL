/// Passes the flag `-visualc-tools-root`
public struct VisualcToolsRoot: UnsafeFlag {
  public let root: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(root)"]
  }

  public init(_ root: String) {
    self.root = root
  }
}
