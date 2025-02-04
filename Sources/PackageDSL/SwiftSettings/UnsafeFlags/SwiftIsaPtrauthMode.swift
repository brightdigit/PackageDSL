/// Passes the flag `-swift-isa-ptrauth-mode`
///
public struct SwiftIsaPtrauthMode: UnsafeFlag {
  public let mode: String

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(mode)"]
  }

  public init(_ mode: String) {
    self.mode = mode
  }
}
