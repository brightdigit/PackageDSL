//
// BushelMachine.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelMachine: Target {
  var dependencies: any Dependencies {
    BushelCore()
    BushelLogging()
  }
}
