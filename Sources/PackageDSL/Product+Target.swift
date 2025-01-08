
//
// Product+Target.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

extension Product where Self: Target {
  /// An array of targets associated with the product.
  var productTargets: [Target] {
    [self]
  }

  /// The type of the target.
  var targetType: TargetType {
    switch productType {
      case .library:
        return .regular
      case .executable:
        return .executable
    }
  }
}
