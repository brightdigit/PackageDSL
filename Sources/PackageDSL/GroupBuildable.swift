
//
// GroupBuildable.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import Foundation

/// A protocol that defines a type that can be built from an array of itself.
public protocol GroupBuildable {
  /// The type of the output.
  associatedtype Output = Self

  /// Constructs an array of `Output` from the given array of `Self`.
  ///
  /// - Parameter array: The array of `Self` to construct the `Output` from.
  /// - Returns: An array of `Output` constructed from the given array of `Self`.
  static func output(from array: [Self]) -> [Self.Output]
}

extension GroupBuildable where Output == Self {
  /// Constructs an array of `Output` from the given array of `Self`.
  ///
  /// - Parameter array: The array of `Self` to construct the `Output` from.
  /// - Returns: An array of `Output` constructed from the given array of `Self`.
  static func output(from array: [Self]) -> [Self.Output] {
    array
  }
}
