//
// TestTargetBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

/// Builds a collection ``TestTargets``
/// <#Description#>
@resultBuilder
public enum TestTargetBuilder {
  /// Creates the ``TestTargets``
  /// - Parameter first: A collection of ``TestTarget``
  /// - Returns: ``TestTargets``
  public static func buildPartialBlock(first: [any TestTarget]) -> any TestTargets {
    first
  }

  /// Creates the ``TestTargets``
  /// - Parameter first: A ``TestTarget``
  /// - Returns: ``TestTargets``
  public static func buildPartialBlock(first: any TestTarget) -> any TestTargets {
    [first]
  }

  /// Creates the ``TestTargets``
  /// - Parameters:
  ///   - accumulated: ``TestTargets``
  ///   - next: A ``TestTarget``
  /// - Returns: New ``TestTargets
  public static func buildPartialBlock(
    accumulated: any TestTargets,
    next: any TestTarget
  ) -> any TestTargets {
    accumulated + [next]
  }

  /// Creates the ``TestTargets``
  /// - Parameters:
  ///   - accumulated: ``TestTargets``
  ///   - next: A collection of ``TestTarget``
  /// - Returns: New ``TestTargets``
  public static func buildPartialBlock(
    accumulated: any TestTargets,
    next: any TestTargets
  ) -> any TestTargets {
    accumulated.appending(next)
  }
}
