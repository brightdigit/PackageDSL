//
// SupportedPlatforms.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

public protocol SupportedPlatforms: Sequence where Element == SupportedPlatform {
    // swiftlint:disable:next identifier_name
    init<S>(_ s: S) where S.Element == SupportedPlatform, S: Sequence
    func appending(_ platforms: any SupportedPlatforms) -> Self
}
