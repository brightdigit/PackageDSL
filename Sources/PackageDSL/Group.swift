//
//  File.swift
//  
//
//  Created by Leo Dion on 4/26/24.
//

import Foundation

public struct Group<T> {
  internal init(_ name: String? = nil) {
    self.name = name
  }
  
  public let name : String?
  public func callAsFunction(@GroupBuilder<T> content: () -> [T]) -> [T] {
    content()
  }
}
