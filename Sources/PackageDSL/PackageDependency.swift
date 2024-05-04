//
// PackageDependency.swift
// Copyright (c) 2024 BrightDigit.
//

import Foundation
import PackageDescription

protocol PackageDependency: _Named {
    // var productName: String { get }
    var packageName: String { get }
    var dependency: _PackageDescription_PackageDependency { get }
}

extension PackageDependency where Self: TargetDependency {
    var package: any PackageDependency {
        self
    }

    //  var productName: String {
//    name
    //  }
//
    //  var targetDepenency: _PackageDescription_TargetDependency {
//    .product(name: name, package: package.packageName)
    //  }

    var targetDepenency: _PackageDescription_TargetDependency {
        switch dependency.kind {
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

extension PackageDependency {
    //  var productName: String {
//    "\(Self.self)"
    //  }

    var packageName: String {
        switch dependency.kind {
        case let .sourceControl(name: name, location: location, requirement: _):
            return name ?? location.packageName ?? self.name

        case let .fileSystem(name: name, path: path):
            return name ?? path.packageName ?? self.name

        case let .registry(id: id, requirement: _):
            return id
        @unknown default:
            return name
        }
    }

    //  var targetDepenency: _PackageDescription_TargetDependency {
//    switch self.dependency.kind {
//    case let .sourceControl(name: name, location: location, requirement: _):
//      let packageName = name ?? location.packageName
//      return .product(name: productName, package: packageName)
//
//    case let .fileSystem(name: name, path: path):
//      if let packageName = name ?? path.components(separatedBy: "/").last {
//        return .product(name: productName, package: packageName)
//      } else {
//        return .byName(name: productName)
//      }
//
//    case .registry:
//      return .byName(name: productName)
//    @unknown default:
//      return .byName(name: productName)
//    }
    //  }
}
