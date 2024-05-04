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

public extension Target {
    var targetType: TargetType {
        .regular
    }

    var targetDepenency: _PackageDescription_TargetDependency {
        .target(name: name)
    }

    var swiftSettings: [SwiftSetting] {
        []
    }

    var resources: [Resource] {
        []
    }

    var path: String? {
        nil
    }
}
