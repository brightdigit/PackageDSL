//
//  File.swift
//  
//
//  Created by Leo Dion on 4/26/24.
//

import Foundation

public protocol GroupBuildable {
  associatedtype Output = Self
  static func output(from array: [Self]) -> [Self.Output]
}

extension GroupBuildable where Output == Self {
  static func output(from array: [Self]) -> [Self.Output] {
    return array
  }
  
}
