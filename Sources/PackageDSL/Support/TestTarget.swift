//
// TestTarget.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

protocol TestTarget: Target {}

extension TestTarget {
  var targetType: TargetType {
    .test
  }
}
