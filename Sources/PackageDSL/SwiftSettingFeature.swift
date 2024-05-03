//
// SwiftSettingFeature.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

public protocol SwiftSettingFeature: _Named, SwiftSettingConvertible {
  var featureState: FeatureState { get }
}

public extension SwiftSettingFeature {
  var featureState: FeatureState {
    .upcoming
  }

  var setting: SwiftSetting {
    self.featureState.swiftSetting(name: name)
  }
}
