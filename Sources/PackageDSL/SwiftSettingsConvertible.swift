import PackageDescription

public protocol SwiftSettingsConvertible : GroupBuildable {
  typealias Output = SwiftSetting
  func swiftSettings () -> [SwiftSetting]
}

extension SwiftSettingsConvertible {
  public static func output(from array: [Self]) -> [SwiftSetting] {
    array.flatMap{$0.swiftSettings()}
  }
}
