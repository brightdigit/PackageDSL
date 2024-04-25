//
// SwiftSettingsBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//


 




@resultBuilder
enum SwiftSettingsBuilder {
  static func buildPartialBlock(first: SwiftSetting) -> [SwiftSetting] {
    [first]
  }

  static func buildPartialBlock(accumulated: [SwiftSetting], next: SwiftSetting) -> [SwiftSetting] {
    accumulated + [next]
  }
  
  static func buildPartialBlock(first: SwiftSettingsConvertible) -> [SwiftSetting] {
    first.swiftSettings()
  }

  static func buildPartialBlock(accumulated: [SwiftSetting], next: SwiftSettingsConvertible) -> [SwiftSetting] {
    accumulated + next.swiftSettings()
  }
}
