//
// ResourcesBuilder.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

@resultBuilder
enum ResourcesBuilder {
    static func buildPartialBlock(first: Resource) -> [Resource] {
        [first]
    }

    static func buildPartialBlock(accumulated: [Resource], next: Resource) -> [Resource] {
        accumulated + [next]
    }
}
