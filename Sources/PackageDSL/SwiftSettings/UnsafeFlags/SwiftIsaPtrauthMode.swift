/// Passes the flag `-swift-isa-ptrauth-mode`
public struct SwiftIsaPtrauthMode: UnsafeFlag {
  public let mode: String

  public init(_ mode: String) {
    self.mode = mode
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(mode)"]
  }
}
