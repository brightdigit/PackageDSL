//
// SupportedPlatforms.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

public protocol SupportedPlatforms: Sequence where Element == SupportedPlatform {
  init<S>(_ sequence: S) where S.Element == SupportedPlatform, S: Sequence
  func appending(_ platforms: any SupportedPlatforms) -> Self
}
