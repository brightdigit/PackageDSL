//
// FelinePine.swift
// Copyright (c) 2023 BrightDigit.
//

import PackageDescription

struct FelinePine: PackageDependency {
  var dependency: Package.Dependency {
    .package(url: "https://github.com/brightdigit/FelinePine.git", from: "0.1.0-alpha.3")
  }
}
