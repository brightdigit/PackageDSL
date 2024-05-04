//
// UnsafeFlag.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

public protocol UnsafeFlag: SwiftSettingConvertible, _Named {
    var unsafeFlagArgument: String { get }
}

public extension UnsafeFlag {
    var unsafeFlagArgument: String {
        name.camelToSnakeCase()
    }

    var setting: SwiftSetting {
        .unsafeFlags([unsafeFlagArgument])
    }
}
