//
// UnsafeFlag.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

public protocol UnsafeFlag: SwiftSettingConvertible, _Named {
  var unsafeFlagArgument: String { get }
}

extension UnsafeFlag {
  public var unsafeFlagArgument: String {
    name.camelToSnakeCase()
  }

  public var setting: SwiftSetting {
    .unsafeFlags([unsafeFlagArgument])
  }
}
