//
// TestTargets.swift
// Copyright (c) 2024 BrightDigit.
//

public protocol TestTargets: Sequence where Element == any TestTarget {
    // swiftlint:disable:next identifier_name
    init<S>(_ s: S) where S.Element == any TestTarget, S: Sequence
    func appending(_ testTargets: any TestTargets) -> Self
}
