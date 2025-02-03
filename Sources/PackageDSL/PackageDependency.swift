//
// PackageDependency.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import Foundation
import PackageDescription

/// A protocol that represents a package dependency.
public protocol PackageDependency: _Named {
  /// The name of the package.
  var packageName: String { get }
  /// The package dependency description.
  var dependency: _PackageDescription_PackageDependency { get }
}

extension PackageDependency where Self: TargetDependency {
  /// The package dependency.
  var package: any PackageDependency {
    self
  }

  /// The target dependency.
  var targetDependency: _PackageDescription_TargetDependency {
    switch dependency.kind {
      case .sourceControl(let name, let location, requirement: _):
        let packageName = name ?? location.packageName ?? self.packageName
        return .product(
          name: productName,
          package: packageName,
          condition: self.condition
        )

      case .fileSystem(let name, let path):
        if let packageName = name ?? path.components(separatedBy: "/").last {
          return .product(
            name: productName,
            package: packageName,
            condition: self.condition
          )
        } else {
          return .byName(name: productName)
        }

      case .registry: return .byName(name: productName)

      @unknown default: return .byName(name: productName)
    }
  }
}

extension PackageDependency {
  /// The name of the package.
  var packageName: String {
    switch dependency.kind {
      case .sourceControl(let name, let location, requirement: _):
        return name ?? location.packageName ?? self.name

      case .fileSystem(let name, let path):
        return name ?? path.packageName ?? self.name

      case .registry(let id, requirement: _):
        return id

      @unknown default:
        return name
    }
  }
}
