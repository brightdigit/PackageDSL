/// Passes the flag `-swift-ptrauth-mode`
public struct SwiftPtrauthMode: UnsafeFlag {
  public let mode: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(mode)"]
  }

  public init(_ mode: String) {
    self.mode = mode
  }
}
