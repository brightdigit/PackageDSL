//
// TestTarget.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

public protocol TestTarget: Target, GroupBuildable {}

extension TestTarget {
  public var targetType: TargetType {
    .test
  }
}
