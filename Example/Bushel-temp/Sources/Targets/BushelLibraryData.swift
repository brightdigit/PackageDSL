//
// BushelLibraryData.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelLibraryData: Target {
  var dependencies: any Dependencies {
    BushelLibrary()
    BushelLogging()
    BushelDataCore()
  }
}
