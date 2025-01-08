
//
// ResourcesBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

/// A result builder for creating an array of `Resource` objects.
@resultBuilder
public enum ResourcesBuilder {
    /// Builds a partial block with a single `Resource` object.
    ///
    /// - Parameter first: The first `Resource` object.
    /// - Returns: An array containing the `first` `Resource` object.
    public static func buildPartialBlock(first: Resource) -> [Resource] {
        [first]
    }

    /// Builds a partial block by appending a `Resource` object to an existing array of `Resource` objects.
    ///
    /// - Parameters:
    ///   - accumulated: The existing array of `Resource` objects.
    ///   - next: The `Resource` object to be appended.
    /// - Returns: The updated array of `Resource` objects.
    public static func buildPartialBlock(accumulated: [Resource], next: Resource) -> [Resource] {
        accumulated + [next]
    }
}
