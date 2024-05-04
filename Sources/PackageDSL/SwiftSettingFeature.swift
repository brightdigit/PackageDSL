//
// SwiftSettingFeature.swift
// Copyright (c) 2024 BrightDigit.
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
