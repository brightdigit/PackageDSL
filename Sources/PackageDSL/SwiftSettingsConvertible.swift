//
// SwiftSettingsConvertible.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

public protocol SwiftSettingsConvertible: GroupBuildable where Output == SwiftSetting {
    func swiftSettings() -> [SwiftSetting]
}

public extension SwiftSettingsConvertible {
    static func output(from array: [Self]) -> [SwiftSetting] {
        array.flatMap {
            $0.swiftSettings()
        }
    }
}
