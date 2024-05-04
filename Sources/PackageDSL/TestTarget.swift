//
// TestTarget.swift
// Copyright (c) 2024 BrightDigit.
//

public protocol TestTarget: Target, GroupBuildable {}

extension TestTarget {
  public var targetType: TargetType {
    .test
  }
}
