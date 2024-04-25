//
// DisableOutwardActorInference.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0401-remove-property-wrapper-isolation.md
public struct DisableOutwardActorInference: SwiftSettingFeature {
  public var featureState: FeatureState {
    return .upcoming
  }
}
