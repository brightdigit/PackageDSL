
//
// Group.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import Foundation

/// A group that can be used with the `@GroupBuilder` to create a collection of elements.
public struct Group<T> {
    /// Creates a new group with an optional name.
    /// - Parameter name: The name of the group, or `nil` if the group has no name.
    internal init(_ name: String? = nil) {
        self.name = name
    }

    /// The name of the group, or `nil` if the group has no name.
    public let name: String?

    /// Executes the content closure and returns the resulting array of elements.
    /// - Parameter content: A closure that returns an array of elements of type `T`.
    /// - Returns: The array of elements returned by the content closure.
    public func callAsFunction(@GroupBuilder<T> content: () -> [T]) -> [T] {
        content()
    }
}
