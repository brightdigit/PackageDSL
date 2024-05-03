//
// String.swift
// Copyright (c) 2024 BrightDigit.
//

extension String {
  var packageName: String? {
    self.split(separator: "/").last?.split(separator: ".").first.map(String.init)
  }

  func camelToSnakeCase(withSeparator separator: String = "-") -> String {
    separator + self.enumerated().reduce("") { $0 + ($1.offset > 0 && $1.element.isUppercase ? separator : "") + String($1.element).lowercased() }
  }
}
