/// Passes the flag `-enable-destroy-hoisting=true`
public struct EnableDestroyHoisting: FrontendFlag {
    public let value: String

    public init(_ value: String) {
        self.value = value
    }

    public var flagArguments: [String] {
        ["\(name.camelToSnakeCaseFlag())=\(value)"]
    }
}
