//
// _Named.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// swiftlint:disable type_name

// swift-format-ignore: NoLeadingUnderscores
public protocol _Named {
  var name: String { get }
}

extension _Named {
  public var name: String {
    "\(Self.self)"
  }
}
// swiftlint:enable type_name
