//
// Array+TestTargets.swift
// Copyright (c) 2024 BrightDigit.
//

extension Array: TestTargets where Element == any TestTarget {
    public func appending(_ testTargets: any TestTargets) -> [any TestTarget] {
        self + testTargets
    }
}
