//
// FeatureState.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

public enum FeatureState {
  case upcoming
  case experimental
}

extension FeatureState {
  public func swiftSetting(name: String) -> SwiftSetting {
    switch self {
      case .experimental:
        .enableExperimentalFeature(name)

      case .upcoming:
        .enableUpcomingFeature(name)
    }
  }
}
