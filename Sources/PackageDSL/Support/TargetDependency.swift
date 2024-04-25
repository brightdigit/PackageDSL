//
// TargetDependency.swift
// Copyright © 2024 , LLC.
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

protocol TargetDependency: Dependency, _Named {
  var productName: String { get }
  var package: PackageDependency { get }
}

extension TargetDependency {
  var productName: String {
    name
  }

  var targetDepenency: _PackageDescription_TargetDependency {
    .product(name: name, package: package.packageName)
  }
}
