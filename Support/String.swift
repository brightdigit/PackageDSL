//
// String.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

extension String {
  var packageName: String? {
    self.split(separator: "/").last?.split(separator: ".").first.map(String.init)
  }
}
