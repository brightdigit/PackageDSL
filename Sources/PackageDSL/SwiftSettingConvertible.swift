import PackageDescription

public protocol SwiftSettingConvertible : SwiftSettingsConvertible {
  var setting : SwiftSetting { get }
}

extension SwiftSettingConvertible {
  public func swiftSettings () -> [SwiftSetting] {
    return [setting]
  }
}
