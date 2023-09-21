//
// Index.swift
// Copyright (c) 2023 BrightDigit.
//

import PackageDescription

let package = Package {
  BushelCommand()
  BushelLibraryApp()
  BushelMachineApp()
  BushelSettingsApp()
  BushelApp()
} testTargets: {
  BushelCoreTests()
  BushelMachineTests()
} swiftSettings: {
  SwiftSetting.enableUpcomingFeature("BareSlashRegexLiterals")
  SwiftSetting.enableUpcomingFeature("ConciseMagicFile")
  SwiftSetting.enableUpcomingFeature("ExistentialAny")
  SwiftSetting.enableUpcomingFeature("ForwardTrailingClosures")
  SwiftSetting.enableUpcomingFeature("ImplicitOpenExistentials")
  SwiftSetting.enableUpcomingFeature("StrictConcurrency")
}
.supportedPlatforms {
  WWDC2023()
}
.defaultLocalization(.english)