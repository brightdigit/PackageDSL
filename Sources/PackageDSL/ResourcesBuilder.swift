//
// ResourcesBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

@resultBuilder
public enum ResourcesBuilder {
  public static func buildPartialBlock(first: Resource) -> [Resource] {
    [first]
  }

  public static func buildPartialBlock(accumulated: [Resource], next: Resource) -> [Resource] {
    accumulated + [next]
  }
}
