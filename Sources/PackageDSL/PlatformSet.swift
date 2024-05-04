//
// PlatformSet.swift
// Copyright (c) 2024 BrightDigit.
//

protocol PlatformSet {
    @SupportedPlatformBuilder
    var body: any SupportedPlatforms { get }
}
