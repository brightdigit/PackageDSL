
//
// ProductsBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

/// A result builder for creating arrays of `Product` instances.
@resultBuilder
public enum ProductsBuilder {
    /// Builds a partial block from the first element in the array.
    /// - Parameter first: The first `Product` element in the array.
    /// - Returns: An array containing the first `Product` element.
    public static func buildPartialBlock(first: [any Product]) -> [any Product] {
        first
    }

    /// Builds a partial block from a single `Product` element.
    /// - Parameter first: The `Product` element.
    /// - Returns: An array containing the `Product` element.
    public static func buildPartialBlock(first: any Product) -> [any Product] {
        [first]
    }

    /// Builds a partial block by accumulating the previous array of `Product` elements and adding the next `Product` element.
    /// - Parameter accumulated: The previous array of `Product` elements.
    /// - Parameter next: The next `Product` element to add.
    /// - Returns: The updated array of `Product` elements.
    public static func buildPartialBlock(accumulated: [any Product], next: any Product) -> [any Product] {
        accumulated + [next]
    }

    /// Builds a partial block by accumulating the previous array of `Product` elements and adding the next array of `Product` elements.
    /// - Parameter accumulated: The previous array of `Product` elements.
    /// - Parameter next: The next array of `Product` elements to add.
    /// - Returns: The updated array of `Product` elements.
    public static func buildPartialBlock(accumulated: [any Product], next: [any Product]) -> [any Product] {
        accumulated + next
    }
}
