//
// TestTarget.swift
// Copyright (c) 2024 BrightDigit.
//

public protocol TestTarget: Target, GroupBuildable {}

public extension TestTarget {
    var targetType: TargetType {
        .test
    }
}
