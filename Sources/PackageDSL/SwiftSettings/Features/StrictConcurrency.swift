
//
// StrictConcurrency.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

/// A struct that represents the Strict Concurrency feature.
public struct StrictConcurrency: SwiftSettingFeature {
    /// The current state of the feature.
    public let featureState: FeatureState

    /// Initializes a new instance of `StrictConcurrency` with the given feature state.
    ///
    /// - Parameter featureState: The feature state, defaults to `.experimental`.
    public init(featureState: FeatureState = .experimental) {
        self.featureState = featureState
    }
}
