/// Passes the flag `-build-id`
///
/// Specify the build ID argument passed to the linker
public struct BuildId: UnsafeFlag {
  public let buildid: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(buildid)"]
  }

  public init(_ buildid: String) {
    self.buildid = buildid
  }
}
