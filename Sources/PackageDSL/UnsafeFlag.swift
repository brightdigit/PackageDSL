//
// UnsafeFlag.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

public protocol UnsafeFlag: SwiftSettingConvertible, _Named {
  var unsafeFlagArguments: [String] { get }
}

extension UnsafeFlag {
  public var unsafeFlagArguments: [String] {
    [name.camelToSnakeCaseFlag()]
  }

  public var setting: SwiftSetting {
    .unsafeFlags(unsafeFlagArguments)
  }
}
