//
// BushelLibraryMacOS.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelLibraryMacOS: Target {
  var dependencies: any Dependencies {
    BushelLibrary()
    BushelMacOSCore()
  }
}
