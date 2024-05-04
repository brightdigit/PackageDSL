//
// Array+SupportedPlatforms.swift
// Copyright (c) 2024 BrightDigit.
//

import PackageDescription

extension Array: SupportedPlatforms where Element == SupportedPlatform {
    public func appending(_ platforms: any SupportedPlatforms) -> Self {
        self + .init(platforms)
    }
}
