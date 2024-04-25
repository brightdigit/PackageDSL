import PackageDescription

protocol SwiftSettingConvertible : SwiftSettingsConvertible {
  var setting : SwiftSetting { get }
}

extension SwiftSettingConvertible {
  func swiftSettings () -> [SwiftSetting] {
    return [setting]
  }
}
