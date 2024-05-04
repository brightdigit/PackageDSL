//
// ResourcesBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
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
