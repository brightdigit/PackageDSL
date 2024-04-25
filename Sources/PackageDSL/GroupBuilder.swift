//
// GroupBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import Foundation

@resultBuilder
public enum GroupBuilder<U> {
  public static func buildPartialBlock<T: GroupBuildable>(accumulated: [U], next: T) -> [U]
  where T.Output == U {
    accumulated + T.output(from: [next])
  }

  public static func buildPartialBlock<T: GroupBuildable>(first: T) -> [U] where T.Output == U {
    T.output(from: [first])
  }
}
