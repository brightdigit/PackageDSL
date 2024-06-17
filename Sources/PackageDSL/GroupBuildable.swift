//
// GroupBuildable.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import Foundation

public protocol GroupBuildable {
  associatedtype Output = Self
  static func output(from array: [Self]) -> [Self.Output]
}

extension GroupBuildable where Output == Self {
  static func output(from array: [Self]) -> [Self.Output] {
    array
  }
}
