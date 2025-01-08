//
// SwiftSettingsBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

/// A result builder for creating collections of `SwiftSetting` instances.
@resultBuilder
public enum SwiftSettingsBuilder {
    /// Builds a partial block with a single `SwiftSetting` instance.
    ///
    /// - Parameter first: The `SwiftSetting` instance to include in the partial block.
    /// - Returns: An array containing the provided `SwiftSetting` instance.
    public static func buildPartialBlock(first: SwiftSetting) -> [SwiftSetting] {
        [first]
    }

    /// Builds a partial block by accumulating the provided `SwiftSetting` instances.
    ///
    /// - Parameters:
    ///   - accumulated: The accumulated `SwiftSetting` instances.
    ///   - next: The next `SwiftSetting` instance to add to the block.
    /// - Returns: An array containing the accumulated `SwiftSetting` instances and the next instance.
    public static func buildPartialBlock(accumulated: [SwiftSetting], next: SwiftSetting) -> [SwiftSetting] {
        accumulated + [next]
    }

    /// Builds a partial block by accumulating the provided `SwiftSetting` instances.
    ///
    /// - Parameters:
    ///   - accumulated: The accumulated `SwiftSetting` instances.
    ///   - next: The next array of `SwiftSetting` instances to add to the block.
    /// - Returns: An array containing the accumulated `SwiftSetting` instances and the next instances.
    public static func buildPartialBlock(accumulated: [SwiftSetting], next: [SwiftSetting]) -> [SwiftSetting] {
        accumulated + next
    }

    /// Builds a partial block with the provided array of `SwiftSetting` instances.
    ///
    /// - Parameter first: The array of `SwiftSetting` instances to include in the partial block.
    /// - Returns: The provided array of `SwiftSetting` instances.
    public static func buildPartialBlock(first: [SwiftSetting]) -> [SwiftSetting] {
        first
    }

    /// Builds a partial block with the `SwiftSetting` instances from the provided `SwiftSettingsConvertible` instance.
    ///
    /// - Parameter first: The `SwiftSettingsConvertible` instance to extract `SwiftSetting` instances from.
    /// - Returns: An array of `SwiftSetting` instances extracted from the provided `SwiftSettingsConvertible` instance.
    public static func buildPartialBlock(first: any SwiftSettingsConvertible) -> [SwiftSetting] {
        first.swiftSettings()
    }

    /// Builds a partial block by accumulating the `SwiftSetting` instances from the provided `SwiftSettingsConvertible` instance.
    ///
    /// - Parameters:
    ///   - accumulated: The accumulated `SwiftSetting` instances.
    ///   - next: The `SwiftSettingsConvertible` instance to extract `SwiftSetting` instances from.
    /// - Returns: An array containing the accumulated `SwiftSetting` instances and the `SwiftSetting` instances extracted from the provided `SwiftSettingsConvertible` instance.
    public static func buildPartialBlock(accumulated: [SwiftSetting], next: any SwiftSettingsConvertible) -> [SwiftSetting] {
        accumulated + next.swiftSettings()
    }
}
