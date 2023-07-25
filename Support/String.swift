//
// String.swift
// Copyright (c) 2023 BrightDigit.
//

extension String {
  var packageName: String? {
    self.split(separator: "/").last?.split(separator: ".").first.map(String.init)
  }
}
