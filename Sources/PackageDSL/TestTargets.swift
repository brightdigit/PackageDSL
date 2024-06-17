//
// TestTargets.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

public protocol TestTargets: Sequence where Element == any TestTarget {
  init<S>(_ s: S) where S.Element == any TestTarget, S: Sequence
  func appending(_ testTargets: any TestTargets) -> Self
}
