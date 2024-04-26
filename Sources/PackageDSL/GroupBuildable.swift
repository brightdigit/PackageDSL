//
//  File.swift
//  
//
//  Created by Leo Dion on 4/26/24.
//

import Foundation

public protocol GroupBuildable {
  associatedtype Output
  static func output(from array: [Self]) -> [Output]
}
