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
}
testTargets: {
  BushelCoreTests()
}
.supportedPlatforms {
  WWDC2023()
}
.defaultLocalization(.english)
