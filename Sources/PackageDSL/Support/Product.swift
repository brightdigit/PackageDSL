//
// Product.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

protocol Product: _Named {
  var productTargets: [Target] { get }
  var productType: ProductType { get }
}

extension Product {
  var productType: ProductType {
    .library
  }
}
