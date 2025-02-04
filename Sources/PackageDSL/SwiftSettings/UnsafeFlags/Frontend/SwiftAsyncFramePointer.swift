/// Passes the flag `-swift-async-frame-pointer=<value>`
///
/// One of 'auto', 'always' or 'never'
public struct SwiftAsyncFramePointer: FrontendFlag {
  public let value: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
