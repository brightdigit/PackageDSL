//
// Product.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

public protocol Product: _Named, GroupBuildable {
  var productTargets: [Target] { get }
  var productType: ProductType { get }
  var libraryType: LibraryType? { get }
}

extension Product {
  public var productType: ProductType {
    .library
  }
  
  public var libraryType: LibraryType? {
    nil
  }
}
