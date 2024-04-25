//
// Array+TestTargets.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

extension Array: TestTargets where Element == any TestTarget {
  public func appending(_ testTargets: any TestTargets) -> [any TestTarget] {
    self + testTargets
  }
}
