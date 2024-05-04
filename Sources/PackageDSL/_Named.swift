//
// _Named.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// swift-format-ignore: NoLeadingUnderscores
public protocol _Named {
  var name: String { get }
}

extension _Named {
  public var name: String {
    "\(Self.self)"
  }
}
