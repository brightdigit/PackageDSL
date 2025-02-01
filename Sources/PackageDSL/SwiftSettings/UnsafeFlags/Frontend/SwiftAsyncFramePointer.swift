/// Passes the flag `-swift-async-frame-pointer=<value>`
///  One of 'auto', 'always' or 'never'
public struct SwiftAsyncFramePointer: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())=\(value)"]
    }
}
