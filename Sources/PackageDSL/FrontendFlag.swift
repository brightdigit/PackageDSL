//
//  FrontendFlag.swift
//  PackageDSL
//
//  Created by Leo Dion on 2/3/25.
//

public protocol FrontendFlag: UnsafeFlag, _Named {
  /// Arguments to pass to the unsafe flag with `-Xfrontend`
  var flagArguments: [String] { get }
}

extension FrontendFlag {
  /// Arguments to pass to the unsafe flag with `-Xfrontend`
  public var flagArguments: [String] {
    [name.camelToSnakeCaseFlag()]
  }

  /// The arguments for the unsafe flag.
  public var unsafeFlagArguments: [String] {
    ["-Xfrontend", flagArguments.joined(separator: "=")]
  }
}
