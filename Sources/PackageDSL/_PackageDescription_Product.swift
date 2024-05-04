//
// _PackageDescription_Product.swift
// Copyright (c) 2024 BrightDigit.
//

extension _PackageDescription_Product {
    static func entry(_ entry: any Product) -> _PackageDescription_Product {
        let targets = entry.productTargets.map(\.name)

        switch entry.productType {
        case .executable:
            return Self.executable(name: entry.name, targets: targets)

        case .library:
            return Self.library(name: entry.name, targets: targets)
        }
    }
}
