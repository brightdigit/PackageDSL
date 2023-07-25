//
// BushelViewsCore.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelViewsCore: Target {
  var dependencies: any Dependencies {
    BushelLogging()
    BushelUT()
  }
}
