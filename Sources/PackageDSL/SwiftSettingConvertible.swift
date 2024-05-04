//
// SwiftSettingConvertible.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

public protocol SwiftSettingConvertible: SwiftSettingsConvertible {
    var setting: SwiftSetting { get }
}

public extension SwiftSettingConvertible {
    func swiftSettings() -> [SwiftSetting] {
        [setting]
    }
}
