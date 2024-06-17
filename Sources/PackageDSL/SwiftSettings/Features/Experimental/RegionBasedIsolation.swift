//
// RegionBasedIsolation.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0414-region-based-isolation.md
public struct RegionBasedIsolation: SwiftSettingFeature {
  public var featureState: FeatureState {
    return .experimental
  }
}
