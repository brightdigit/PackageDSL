//
// UnsafeFlag.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

import PackageDescription

/// A protocol that represents an unsafe flag for a Swift setting.
public protocol UnsafeFlag: SwiftSettingConvertible, _Named {
  /// The arguments for the unsafe flag.
  var unsafeFlagArguments: [String] { get }
}

extension UnsafeFlag {
  /// The arguments for the unsafe flag.
  public var unsafeFlagArguments: [String] {
    [name.camelToSnakeCaseFlag()]
  }

  /// The Swift setting for the unsafe flag.
  public var setting: SwiftSetting {
    .unsafeFlags(unsafeFlagArguments)
  }
}


public protocol FrontendFlag : GroupBuildable, _Named {
  var flagArguments: [String] { get }
}

extension FrontendFlag {
  public var flagArguments: [String] {
      [name.camelToSnakeCaseFlag()]
  }
}

public struct FrontendFlags : UnsafeFlag {
  public init(@GroupBuilder<any FrontendFlag> frontendFlags: @escaping () -> [any FrontendFlag] ) {
    self.init(frontendFlags: frontendFlags())
  }
  private init(frontendFlags: [any FrontendFlag]) {
    self.frontendFlags = frontendFlags
  }
  
  static let argument = "-Xfrontend"
  
  public let frontendFlags: [any FrontendFlag]
  
  public var unsafeFlagArguments: [String] {
    let arguments = frontendFlags.flatMap(\.flagArguments)
    if arguments.isEmpty {
      return []
    }
    return [Self.argument] + arguments
  }
}

/// A struct that represents a warning for long expression type checking.
public struct WarnLongExpressionTypeChecking: FrontendFlag {
  /// Initializes a new instance of `WarnLongExpressionTypeChecking`.
  /// - Parameter milliseconds: The number of milliseconds to use for the warning threshold.
  public init(milliseconds: Int) {
    self.milliseconds = milliseconds
  }

  /// The number of milliseconds to use for the warning threshold.
  public let milliseconds: Int

  /// The unsafe flag arguments to be used for the warning.
  public var flagArguments: [String] {
    [
      "-warn-long-expression-type-checking=\(milliseconds)"
    ]
  }
}
