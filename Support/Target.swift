//
// Target.swift
// Copyright (c) 2023 BrightDigit.
// Licensed under MIT License
//

protocol Target: _Depending, Dependency, _Named {
  var targetType: TargetType { get }

  @SwiftSettingsBuilder
  var swiftSettings: [SwiftSetting] { get }

  @ResourcesBuilder
  var resources: [Resource] { get }
  
  var path: String? { get }
}

extension Target {
  var targetType: TargetType {
    .regular
  }

  var targetDepenency: _PackageDescription_TargetDependency {
    .target(name: self.name)
  }

  var swiftSettings: [SwiftSetting] {
    []
  }

  var resources: [Resource] {
    []
  }
  
  var path: String? {
    return nil
  }
}
