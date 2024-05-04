//
// PackageDependency.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import Foundation
import PackageDescription

protocol PackageDependency: _Named {
  var packageName: String { get }
  var dependency: _PackageDescription_PackageDependency { get }
}

extension PackageDependency where Self: TargetDependency {
  var package: any PackageDependency {
    self
  }

  var targetDepenency: _PackageDescription_TargetDependency {
    switch dependency.kind {
      case .sourceControl(let name, let location, requirement: _):
        let packageName = name ?? location.packageName
        return .product(name: productName, package: packageName)

      case .fileSystem(let name, let path):
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

extension PackageDependency {

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
