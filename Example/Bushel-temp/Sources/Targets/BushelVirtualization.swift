//
// BushelVirtualization.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelVirtualization: Target {
  var dependencies: any Dependencies {
    BushelLibraryMacOS()
    BushelMachineMacOS()
  }
}
