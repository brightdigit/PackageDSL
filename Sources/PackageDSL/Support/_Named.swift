//
// _Named.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

protocol _Named {
  var name: String { get }
}

extension _Named {
  var name: String {
    "\(Self.self)"
  }
}
