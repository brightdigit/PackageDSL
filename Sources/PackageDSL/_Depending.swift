//
// _Depending.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

public protocol _Depending {
  @DependencyBuilder
  var dependencies: any Dependencies { get }
}

extension _Depending {
  public var dependencies: any Dependencies {
    [Dependency]()
  }
}

extension _Depending {
  public func allDependencies() -> [Dependency] {
    self.dependencies.compactMap {
      $0 as? _Depending
    }
    .flatMap {
      $0.allDependencies()
    }
    .appending(self.dependencies)
  }
}
