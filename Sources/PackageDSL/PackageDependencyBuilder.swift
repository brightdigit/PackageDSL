//
// DependencyBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

@resultBuilder
enum PackageDependencyBuilder {
  internal static func buildPartialBlock(first: PackageDependency) -> [any PackageDependency] {
    [first]
  }

  internal static func buildPartialBlock(accumulated: [any PackageDependency], next: PackageDependency) -> [any PackageDependency]{
    accumulated + [next]
  }
}
