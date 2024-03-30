//
// PackageDependency.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

protocol PackageDependency: Dependency {
  var packageName: String { get }
  var dependency: _PackageDescription_PackageDependency { get }
}

extension PackageDependency {
  var productName: String {
    "\(Self.self)"
  }

  var packageName: String {
    switch self.dependency.kind {
    case let .sourceControl(name: name, location: location, requirement: _):
      return name ?? location.packageName ?? productName

    case let .fileSystem(name: name, path: path):
      return name ?? path.packageName ?? productName

    case let .registry(id: id, requirement: _):
      return id
    @unknown default:
      return productName
    }
  }

  var targetDepenency: _PackageDescription_TargetDependency {
    switch self.dependency.kind {
    case let .sourceControl(name: name, location: location, requirement: _):
      let packageName = name ?? location.packageName
      return .product(name: productName, package: packageName)
    case let .fileSystem(name: name, path: path):
      if let packageName = name ?? path.components(separatedBy: "/").last {
        return .product(name: productName, package: packageName)
      } else {
        return .byName(name: productName)
      }
    case .registry:
      return .byName(name: productName)
    @unknown default:
      return .byName(name: productName)
    }
  }
}
