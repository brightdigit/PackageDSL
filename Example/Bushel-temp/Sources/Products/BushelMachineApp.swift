//
// BushelMachineApp.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelMachineApp: Target, Product {
  var dependencies: any Dependencies {
    BushelMachineViews()
    BushelMachineMacOS()
  }
}
