import PackageDescription

public protocol UnsafeFlag : SwiftSettingConvertible, _Named {
  var unsafeFlagArgument : String { get }
}

extension UnsafeFlag {
  public var unsafeFlagArgument : String {
    self.name.camelToSnakeCase()
  }
  
  public var setting : SwiftSetting {
    .unsafeFlags([self.unsafeFlagArgument])
  }
}
