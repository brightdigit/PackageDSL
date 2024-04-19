//
// ProductsBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

@resultBuilder
enum ProductsBuilder {
  static func buildPartialBlock(first: Product) -> [Product] {
    [first]
  }

  static func buildPartialBlock(accumulated: [Product], next: Product) -> [Product] {
    accumulated + [next]
  }
}
