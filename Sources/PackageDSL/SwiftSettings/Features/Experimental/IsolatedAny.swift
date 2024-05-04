//
// IsolatedAny.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0431-isolated-any-functions.md
public struct IsolatedAny: SwiftSettingFeature {
  public var featureState: FeatureState {
    return .experimental
  }
}
