//
// UnsafeFlag.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription
/// A protocol that represents an unsafe flag for a Swift setting.
public protocol UnsafeFlag: SwiftSettingConvertible, _Named {
    /// The arguments for the unsafe flag.
    var unsafeFlagArguments: [String] { get }
}

extension UnsafeFlag {
    /// The arguments for the unsafe flag.
    public var unsafeFlagArguments: [String] {
        [name.camelToSnakeCaseFlag()]
    }

    /// The Swift setting for the unsafe flag.
    public var setting: SwiftSetting {
        .unsafeFlags(unsafeFlagArguments)
    }
}
