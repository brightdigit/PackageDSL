//
// Product.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

public protocol Product: _Named {
  var productTargets: [Target] { get }
  var productType: ProductType { get }
}

extension Product {
  public var productType: ProductType {
    .library
  }
}
