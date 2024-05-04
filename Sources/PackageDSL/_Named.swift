//
// _Named.swift
// Copyright (c) 2024 BrightDigit.
//

public protocol _Named {
  var name: String { get }
}

extension _Named {
  public var name: String {
    "\(Self.self)"
  }
}
