//
// Dependency.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

public protocol Dependency {
    var targetDepenency: _PackageDescription_TargetDependency { get }
}
