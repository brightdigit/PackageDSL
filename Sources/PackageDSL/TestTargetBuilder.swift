//
// TestTargetBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

@resultBuilder
public enum TestTargetBuilder {
  public static func buildPartialBlock(first: [any TestTarget]) -> any TestTargets {
    first
  }

  public static func buildPartialBlock(first: any TestTarget) -> any TestTargets {
    [first]
  }

  public static func buildPartialBlock(accumulated: any TestTargets, next: any TestTarget)
    -> any TestTargets
  {
    accumulated + [next]
  }

  public static func buildPartialBlock(accumulated: any TestTargets, next: any TestTargets)
    -> any TestTargets
  {
    accumulated.appending(next)
  }
}
