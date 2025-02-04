//
// Array+Depedencies.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

/// Extension to append `Dependencies` to an `Array` of `Dependency` elements.
extension Array: Dependencies where Element == Dependency {
  /// Appends the provided `Dependencies` to the current `Array` of `Dependency` elements.
  ///
  /// - Parameter dependencies: The `Dependencies` to be appended.
  /// - Returns: A new array containing the original elements and the appended items.
  public func appending(_ dependencies: any Dependencies) -> [Dependency] {
    self + dependencies
  }
}
