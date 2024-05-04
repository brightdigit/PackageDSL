//
// SwiftSettingsBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

@resultBuilder
public enum SwiftSettingsBuilder {
  public static func buildPartialBlock(first: SwiftSetting) -> [SwiftSetting] {
    [first]
  }

  public static func buildPartialBlock(accumulated: [SwiftSetting], next: SwiftSetting)
    -> [SwiftSetting]
  {
    accumulated + [next]
  }

  public static func buildPartialBlock(accumulated: [SwiftSetting], next: [SwiftSetting])
    -> [SwiftSetting]
  {
    accumulated + next
  }

  public static func buildPartialBlock(first: [SwiftSetting]) -> [SwiftSetting] {
    first
  }

  public static func buildPartialBlock(first: any SwiftSettingsConvertible) -> [SwiftSetting] {
    first.swiftSettings()
  }

  public static func buildPartialBlock(
    accumulated: [SwiftSetting],
    next: any SwiftSettingsConvertible
  ) -> [SwiftSetting] {
    accumulated + next.swiftSettings()
  }
}
