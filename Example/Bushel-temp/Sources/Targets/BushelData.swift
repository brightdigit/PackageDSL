//
// BushelData.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelData: Target {
  var dependencies: any Dependencies {
    BushelLibraryData()
    BushelMachineData()
  }
}
