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
    self.name.camelToSnakeCase()
  }

  var setting: SwiftSetting {
    .unsafeFlags([self.unsafeFlagArgument])
  }
}
