//
// TestTarget.swift
// Copyright (c) 2023 BrightDigit.
//

protocol TestTarget: Target {}

extension TestTarget {
  var targetType: TargetType {
    .test
  }
}
