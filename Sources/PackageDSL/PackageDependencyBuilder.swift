//
// DependencyBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

@resultBuilder
public enum PackageDependencyBuilder {
  public  static func buildPartialBlock(first: PackageDependency) -> [any PackageDependency] {
    [first]
  }

  public  static func buildPartialBlock(accumulated: [any PackageDependency], next: PackageDependency) -> [any PackageDependency]{
    accumulated + [next]
  }
}
