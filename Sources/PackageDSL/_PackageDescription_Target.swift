
//
// _PackageDescription_Target.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

extension _PackageDescription_Target {
    /// Creates a new target based on the provided `entry` and optional `swiftSettings`.
    ///
    /// - Parameters:
    ///   - entry: The `Target` to be used as the basis for the new target.
    ///   - swiftSettings: An optional array of `SwiftSetting` values to be applied to the new target.
    /// - Returns: A new `_PackageDescription_Target` instance based on the provided `entry` and `swiftSettings`.
    static func entry(_ entry: Target, swiftSettings: [SwiftSetting] = []) -> _PackageDescription_Target {
        let dependencies = entry.dependencies.map(\.targetDependency)
        switch entry.targetType {
        case .executable:
            return .executableTarget(
                name: entry.name,
                dependencies: dependencies,
                path: entry.path,
                resources: entry.resources,
                swiftSettings: swiftSettings + entry.swiftSettings
            )
        case .regular:
            return .target(
                name: entry.name,
                dependencies: dependencies,
                path: entry.path,
                resources: entry.resources,
                swiftSettings: swiftSettings + entry.swiftSettings
            )
        case .test:
            return .testTarget(
                name: entry.name,
                dependencies: dependencies,
                path: entry.path,
                resources: entry.resources,
                swiftSettings: swiftSettings + entry.swiftSettings
            )
        }
    }
}
