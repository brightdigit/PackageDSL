
//
// Product.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

/// A protocol that defines a product.
public protocol Product: _Named, GroupBuildable {
    /// The targets associated with the product.
    var productTargets: [Target] { get }
    
    /// The type of the product.
    var productType: ProductType { get }
    
    /// The type of the library, if the product is a library.
    var libraryType: LibraryType? { get }
}

extension Product {
    /// The type of the product.
    public var productType: ProductType {
        .library
    }
    
    /// The type of the library, if the product is a library.
    public var libraryType: LibraryType? {
        nil
    }
}
