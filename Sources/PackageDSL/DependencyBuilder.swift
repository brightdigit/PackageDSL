//
// DependencyBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

@resultBuilder
public enum DependencyBuilder {
  public static func buildPartialBlock(first: Dependency) -> any Dependencies {
    [first]
  }

  public static func buildPartialBlock(accumulated: any Dependencies, next: Dependency) -> any Dependencies
  {
    accumulated + [next]
  }
}
