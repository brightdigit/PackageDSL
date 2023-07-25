//
// PlatformSet.swift
// Copyright (c) 2023 BrightDigit.
//

protocol PlatformSet {
  @SupportedPlatformBuilder
  var body: any SupportedPlatforms { get }
}
