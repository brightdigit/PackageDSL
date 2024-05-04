//
// ProductsBuilder.swift
// Copyright (c) 2024 BrightDigit.
//

@resultBuilder
public enum ProductsBuilder {
    public static func buildPartialBlock(first: [any Product]) -> [any Product] {
        first
    }

    public static func buildPartialBlock(first: any Product) -> [any Product] {
        [first]
    }

    public static func buildPartialBlock(accumulated: [any Product], next: any Product) -> [any Product] {
        accumulated + [next]
    }

    public static func buildPartialBlock(accumulated: [any Product], next: [any Product]) -> [any Product] {
        accumulated + next
    }
}
