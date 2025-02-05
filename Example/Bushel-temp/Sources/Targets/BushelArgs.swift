//
// BushelArgs.swift
// Copyright (c) 2023 BrightDigit.
//

struct BushelArgs: Target {
  var dependencies: any Dependencies {
    ArgumentParser()
  }
}
