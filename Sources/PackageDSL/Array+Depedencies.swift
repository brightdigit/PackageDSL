//
// Array+Depedencies.swift
// Copyright (c) 2024 BrightDigit.
//

extension Array: Dependencies where Element == Dependency {
    public func appending(_ dependencies: any Dependencies) -> [Dependency] {
        self + dependencies
    }
}
