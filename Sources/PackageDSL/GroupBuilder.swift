//
//  File.swift
//  
//
//  Created by Leo Dion on 4/26/24.
//

import Foundation

@resultBuilder
public enum GroupBuilder<T : GroupBuildable> {
  public static func buildPartialBlock(first: [T.Output]) -> [T.Output]{
    return first
  }
  public static func buildPartialBlock(first: T) -> [T.Output] {
    T.output(from: [first])
  }

  public static func buildPartialBlock(accumulated: [T.Output], next: T) -> [T.Output] {
    accumulated + T.output(from: [next])
  }
  
  public static func buildPartialBlock(first: [T]) -> [T.Output] {
    T.output(from: first)
  }
}

