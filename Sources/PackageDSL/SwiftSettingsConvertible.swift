
//
// SwiftSettingsConvertible.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

/// A protocol that defines a type that can be converted to a collection of `SwiftSetting` values.
public protocol SwiftSettingsConvertible: GroupBuildable where Output == SwiftSetting {
    /// Returns an array of `SwiftSetting` values.
    func swiftSettings() -> [SwiftSetting]
}

extension SwiftSettingsConvertible {
    /// Returns an array of `SwiftSetting` values by flattening the `swiftSettings()` arrays of the provided `SwiftSettingsConvertible` instances.
    ///
    /// - Parameter array: An array of `SwiftSettingsConvertible` instances.
    /// - Returns: An array of `SwiftSetting` values.
    public static func output(from array: [Self]) -> [SwiftSetting] {
        array.flatMap {
            $0.swiftSettings()
        }
    }
}
