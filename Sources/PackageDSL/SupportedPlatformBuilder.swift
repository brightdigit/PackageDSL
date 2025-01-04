//
// SupportedPlatformBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

@resultBuilder
public enum SupportedPlatformBuilder {
  public static func buildPartialBlock(first: SupportedPlatform) -> any SupportedPlatforms {
    [first]
  }

  public static func buildPartialBlock(first: PlatformSet) -> any SupportedPlatforms {
    first.body
  }

  public static func buildPartialBlock(first: any SupportedPlatforms) -> any SupportedPlatforms {
    first
  }

  public static func buildPartialBlock(
    accumulated: any SupportedPlatforms,
    next: any SupportedPlatforms
  ) -> any SupportedPlatforms {
    accumulated.appending(next)
  }

  public static func buildPartialBlock(
    accumulated: any SupportedPlatforms,
    next: SupportedPlatform
  ) -> any SupportedPlatforms {
    accumulated.appending([next])
  }
}
