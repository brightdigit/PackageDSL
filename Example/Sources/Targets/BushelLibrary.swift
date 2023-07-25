//
// BushelLibrary.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelLibrary: Target {
  var dependencies: any Dependencies {
    BushelLogging()
    BushelCore()
  }
}
