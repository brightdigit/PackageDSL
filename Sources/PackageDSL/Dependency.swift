//
// Dependency.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

public protocol Dependency {
  var targetDepenency: _PackageDescription_TargetDependency { get }
}
