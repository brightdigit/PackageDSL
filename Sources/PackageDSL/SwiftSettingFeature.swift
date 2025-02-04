//
// SwiftSettingFeature.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

public protocol SwiftSettingFeature: _Named, SwiftSettingConvertible {
  /// Whether this is experiemental or upcoming ``FeatureState``
  var featureState: FeatureState { get }
}

extension SwiftSettingFeature {
  /// Whether this is experiemental or upcoming ``FeatureState``
  public var featureState: FeatureState {
    .upcoming
  }

  /// The `SwiftSetting` represented by this type.
  public var setting: SwiftSetting {
    featureState.swiftSetting(name: name)
  }
}
