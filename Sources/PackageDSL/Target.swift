//
// Target.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

public protocol Target: _Depending, Dependency, _Named {
  var targetType: TargetType { get }

  @SwiftSettingsBuilder
  var swiftSettings: [SwiftSetting] { get }

  @ResourcesBuilder
  var resources: [Resource] { get }

  var path: String? { get }
}

extension Target {
  public var targetType: TargetType {
    .regular
  }

  public var targetDepenency: _PackageDescription_TargetDependency {
    .target(name: name)
  }

  public var swiftSettings: [SwiftSetting] {
    []
  }

  public var resources: [Resource] {
    []
  }

  public var path: String? {
    nil
  }
}
