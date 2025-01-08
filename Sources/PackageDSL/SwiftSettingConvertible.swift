
//
// SwiftSettingConvertible.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

/// A protocol that conforming types can use to represent a single `SwiftSetting`.
public protocol SwiftSettingConvertible: SwiftSettingsConvertible {
    /// The `SwiftSetting` represented by this type.
    var setting: SwiftSetting { get }
}

extension SwiftSettingConvertible {
    /// Returns an array containing the single `SwiftSetting` represented by this type.
    ///
    /// - Returns: An array containing the `SwiftSetting` represented by this type.
    public func swiftSettings() -> [SwiftSetting] {
        [setting]
    }
}
