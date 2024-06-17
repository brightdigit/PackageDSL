//
// BushelMachineMacOS.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelMachineMacOS: Target {
  var dependencies: any Dependencies {
    BushelMachine()
    BushelMacOSCore()
  }
}
