//
// NoncopyableGenerics.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0427-noncopyable-generics.md
public struct NoncopyableGenerics: SwiftSettingFeature {
  public var featureState: FeatureState {
    return .experimental
  }
}
