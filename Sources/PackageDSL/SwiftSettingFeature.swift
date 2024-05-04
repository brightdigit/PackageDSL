//
// SwiftSettingFeature.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

public protocol SwiftSettingFeature: _Named, SwiftSettingConvertible {
  var featureState: FeatureState { get }
}

extension SwiftSettingFeature {
  public var featureState: FeatureState {
    .upcoming
  }

  public var setting: SwiftSetting {
    featureState.swiftSetting(name: name)
  }
}
