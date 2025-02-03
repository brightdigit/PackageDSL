/// Passes the flag `-module-alias`
public struct ModuleAlias: UnsafeFlag {
  public let aliasname: String

  public init(_ aliasname: String) {
    self.aliasname = aliasname
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(aliasname)"]
  }
}
