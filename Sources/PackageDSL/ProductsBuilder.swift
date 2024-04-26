//
// ProductsBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

@resultBuilder
public enum ProductsBuilder {
  public static func buildPartialBlock(first: Product) -> [Product] {
    [first]
  }

  public static func buildPartialBlock(accumulated: [Product], next: Product) -> [Product] {
    accumulated + [next]
  }
}
