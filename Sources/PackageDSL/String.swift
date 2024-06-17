//
// String.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

extension String {
  var packageName: String? {
    split(separator: "/").last?.split(separator: ".").first.map(String.init)
  }

  func camelToSnakeCaseFlag(withSeparator separator: String = "-") -> String {
    separator
      + enumerated()
      .reduce("") {
        $0 + ($1.offset > 0 && $1.element.isUppercase ? separator : "")
          + String($1.element).lowercased()
      }
  }
}
