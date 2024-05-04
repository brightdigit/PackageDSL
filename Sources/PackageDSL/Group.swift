//
// Group.swift
// Copyright (c) 2024 BrightDigit.
//

import Foundation

public struct Group<T> {
    internal init(_ name: String? = nil) {
        self.name = name
    }

    public let name: String?
    public func callAsFunction(@GroupBuilder<T> content: () -> [T]) -> [T] {
        content()
    }
}
