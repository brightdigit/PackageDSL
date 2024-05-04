//
// Dependencies.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

public protocol Dependencies: Sequence where Element == Dependency {
  init<S>(_ s: S) where S.Element == Dependency, S: Sequence
  func appending(_ dependencies: any Dependencies) -> Self
}
