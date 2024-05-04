//
// InternalImportsByDefault.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0409-access-level-on-imports.md
public struct InternalImportsByDefault: SwiftSettingFeature {
  public var featureState: FeatureState {
    return .upcoming
  }
}
