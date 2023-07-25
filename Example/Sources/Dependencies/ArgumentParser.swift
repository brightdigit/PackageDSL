//
// ArgumentParser.swift
// Copyright (c) 2023 BrightDigit.
//

struct ArgumentParser: PackageDependency {
  var dependency: Package.Dependency {
    .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.0")
  }
}
