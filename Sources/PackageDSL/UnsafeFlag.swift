//
// UnsafeFlag.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
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
