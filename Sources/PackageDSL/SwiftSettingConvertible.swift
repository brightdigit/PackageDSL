//
// SwiftSettingConvertible.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

public protocol SwiftSettingConvertible: SwiftSettingsConvertible {
  var setting: SwiftSetting { get }
}

extension SwiftSettingConvertible {
  public func swiftSettings() -> [SwiftSetting] {
    [setting]
  }
}
