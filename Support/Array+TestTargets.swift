//
// Array+TestTargets.swift
// Copyright (c) 2023 BrightDigit.
//

extension Array: TestTargets where Element == TestTarget {
  func appending(_ testTargets: any TestTargets) -> [TestTarget] {
    self + testTargets
  }
}
