//
// Array+TestTargets.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

extension Array: TestTargets where Element == TestTarget {
  func appending(_ testTargets: any TestTargets) -> [TestTarget] {
    self + testTargets
  }
}
