/// Passes the flag `-swift-ptrauth-mode`
public struct SwiftPtrauthMode: UnsafeFlag {
  public let mode: String

  public init(_ mode: String) {
    self.mode = mode
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(mode)"]
  }
}
