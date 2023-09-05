//
// Target.swift
// Copyright (c) 2023 BrightDigit.
// Licensed under MIT License
//

protocol Target: _Depending, Dependency, _Named, Resources {
    var targetType: TargetType { get }
}

extension Target {
    var targetType: TargetType {
        return .regular
    }

    var targetDepenency: _PackageDescription_TargetDependency {
        .target(name: name)
    }
}
