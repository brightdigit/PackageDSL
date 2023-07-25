//
// BushelViews.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelViews: Target {
  var dependencies: any Dependencies {
    BushelLibraryViews()
    BushelMachineViews()
    BushelSettingsViews()
  }
}
