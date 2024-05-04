//
// _Depending.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// swift-format-ignore: NoLeadingUnderscores
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
    dependencies.compactMap {
      $0 as? _Depending
    }
    .flatMap {
      $0.allDependencies()
    }
    .appending(dependencies)
  }
}
