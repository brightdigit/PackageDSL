//
// SwiftSettingsConvertible.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

public protocol SwiftSettingsConvertible: GroupBuildable where Output == SwiftSetting {
  func swiftSettings() -> [SwiftSetting]
}

extension SwiftSettingsConvertible {
  public static func output(from array: [Self]) -> [SwiftSetting] {
    array.flatMap {
      $0.swiftSettings()
    }
  }
}
