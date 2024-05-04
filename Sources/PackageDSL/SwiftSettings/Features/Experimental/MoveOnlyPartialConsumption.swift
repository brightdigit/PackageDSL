//
// MoveOnlyPartialConsumption.swift
// Copyright (c) 2024 BrightDigit.
//

// from proposal https://github.com/apple/swift-evolution/blob/main/proposals/0429-partial-consumption.md
public struct MoveOnlyPartialConsumption: SwiftSettingFeature {
    public var featureState: FeatureState {
        .experimental
    }
}
