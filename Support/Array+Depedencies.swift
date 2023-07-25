//
// Array+Depedencies.swift
// Copyright (c) 2023 BrightDigit.
//

extension Array: Dependencies where Element == Dependency {
  func appending(_ dependencies: any Dependencies) -> [Dependency] {
    self + dependencies
  }
}
