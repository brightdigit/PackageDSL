//
// TargetDependency.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

protocol TargetDependency: Dependency, _Named {
  var productName: String { get }
  var package: PackageDependency { get }
  var condition: TargetDependencyCondition? { get }
}

extension TargetDependency {
  var productName: String {
    name
  }

  var targetDependency: _PackageDescription_TargetDependency {
    .product(name: name, package: package.packageName, condition: condition)
  }
  
  var condition: TargetDependencyCondition? { return nil }
}
