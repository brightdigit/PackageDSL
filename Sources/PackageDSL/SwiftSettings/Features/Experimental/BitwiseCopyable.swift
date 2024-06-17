//
// BitwiseCopyable.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0426-bitwise-copyable.md
public struct BitwiseCopyable: SwiftSettingFeature {
  public var featureState: FeatureState {
    return .experimental
  }
}
