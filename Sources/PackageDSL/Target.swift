
//
// Target.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

/// A protocol that defines a target.
public protocol Target: _Depending, Dependency, _Named {
    
    /// The type of the target.
    var targetType: TargetType { get }
    
    /// The Swift settings for the target.
    ///
    /// - Returns: An array of `SwiftSetting` objects.
    @SwiftSettingsBuilder
    var swiftSettings: [SwiftSetting] { get }
    
    /// The resources for the target.
    ///
    /// - Returns: An array of `Resource` objects.
    @ResourcesBuilder
    var resources: [Resource] { get }
    
    /// The path of the target.
    var path: String? { get }
}

extension Target {
    
    /// The target type, which is `.regular` by default.
    public var targetType: TargetType {
        .regular
    }
    
    /// The target dependency, which is a `.target` with the target's name.
    public var targetDependency: _PackageDescription_TargetDependency {
        .target(name: name)
    }
    
    /// The Swift settings for the target, which is an empty array by default.
    public var swiftSettings: [SwiftSetting] {
        []
    }
    
    /// The resources for the target, which is an empty array by default.
    public var resources: [Resource] {
        []
    }
    
    /// The path of the target, which is `nil` by default.
    public var path: String? {
        nil
    }
}
