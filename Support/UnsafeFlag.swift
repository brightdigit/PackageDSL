protocol UnsafeFlag : SwiftSettingConvertible, _Named {
  var unsafeFlagArgument : String { get }
}


extension UnsafeFlag {
  var unsafeFlagArgument : String {
    self.name.camelToSnakeCase()
  }
  
  var setting : SwiftSetting {
    .unsafeFlags([self.unsafeFlagArgument])
  }
}