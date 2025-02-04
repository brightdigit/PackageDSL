/// Passes the flag `-module-alias`
///
public struct ModuleAlias: UnsafeFlag {
  public let aliasname: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(aliasname)"]
  }

  public init(_ aliasname: String) {
    self.aliasname = aliasname
  }
}
