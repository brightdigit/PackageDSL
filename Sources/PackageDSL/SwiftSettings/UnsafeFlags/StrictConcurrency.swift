/// Passes the flag `-strict-concurrency=<value>`
/// Specify the how strict concurrency checking will be. The value may be
/// 'minimal' (most 'Sendable' checking is disabled), 'targeted' ('Sendable'
/// checking is enabled in code that uses the concurrency model, or 'complete'
/// ('Sendable' and other checking is enabled for all code in the module)
public struct StrictConcurrency: UnsafeFlag {
  public let value: String

  public init(_ value: String) {
    self.value = value
  }

  public var unsafeFlagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())=\(value)"]
  }
}
