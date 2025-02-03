/// Passes the flag `-checked-async-objc-bridging=<value>`
/// Control whether checked continuations are used when bridging async calls from
/// Swift to ObjC: 'on', 'off'
public struct CheckedAsyncObjcBridging: FrontendFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())=\(value)"]
  }
}
