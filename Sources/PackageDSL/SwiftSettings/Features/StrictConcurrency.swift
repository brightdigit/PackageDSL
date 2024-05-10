//
// StrictConcurrency.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// from https://www.swift.org/documentation/concurrency/
public struct StrictConcurrency: SwiftSettingFeature {
  public let featureState: FeatureState

  public init (featureState: FeatureState = .experimental) {
    self.featureState = featureState
  }
}
