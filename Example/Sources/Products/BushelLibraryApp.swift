//
// BushelLibraryApp.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelLibraryApp: Product, Target {
  var dependencies: any Dependencies {
    BushelLibraryViews()
    BushelLibraryMacOS()
  }
}
