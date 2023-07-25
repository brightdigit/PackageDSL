//
// WWDC2023.swift
// Copyright (c) 2023 BrightDigit.
//

import PackageDescription

struct WWDC2023: PlatformSet {
  var body: any SupportedPlatforms {
    SupportedPlatform.macOS(.v14)
    SupportedPlatform.iOS(.v17)
    SupportedPlatform.watchOS(.v10)
    SupportedPlatform.tvOS(.v17)
  }
}
