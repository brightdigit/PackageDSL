//
// GlobalConcurrency.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0412-strict-concurrency-for-global-variables.md
public struct GlobalConcurrency: SwiftSettingFeature {
  public var featureState: FeatureState {
    return .upcoming
  }
}
