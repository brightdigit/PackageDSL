//
// TestTargetBuilder.swift
// Copyright (c) 2024 BrightDigit.
//

@resultBuilder
enum TestTargetBuilder {
    static func buildPartialBlock(first: [any TestTarget]) -> any TestTargets {
        first
    }

    static func buildPartialBlock(first: any TestTarget) -> any TestTargets {
        [first]
    }

    static func buildPartialBlock(accumulated: any TestTargets, next: any TestTarget) -> any TestTargets {
        accumulated + [next]
    }

    static func buildPartialBlock(accumulated: any TestTargets, next: any TestTargets) -> any TestTargets {
        accumulated.appending(next)
    }
}
