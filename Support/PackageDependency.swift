//
// PackageDependency.swift
// Copyright (c) 2023 BrightDigit.
//

import PackageDescription

protocol PackageDependency: Dependency {
  var dependency: _PackageDescription_PackageDependency { get }
}

extension PackageDependency {
  var productName: String {
    "\(Self.self)"
  }

  var targetDepenency: _PackageDescription_TargetDependency {
    switch self.dependency.kind {
    case let .sourceControl(name: name, location: location, requirement: _):
      let packageName = name ?? location.packageName
      return .product(name: productName, package: packageName)

    @unknown default:
      return .byName(name: productName)
    }
  }
}
