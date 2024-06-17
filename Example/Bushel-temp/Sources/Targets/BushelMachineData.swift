//
// BushelMachineData.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelMachineData: Target {
  var dependencies: any Dependencies {
    BushelDataCore()
    BushelMachine()
    BushelLogging()
  }
}
