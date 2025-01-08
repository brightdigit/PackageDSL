
//
// Dependency.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

/// A protocol that defines a target dependency.
public protocol Dependency {
    /// The target dependency for this protocol.
    var targetDependency: _PackageDescription_TargetDependency { get }
}
