//
//  FrontendFlag.swift
//  PackageDSL
//
//  Created by Leo Dion on 2/3/25.
//

public protocol FrontendFlag: UnsafeFlag, _Named {
  var flagArguments: [String] { get }
}

extension FrontendFlag {
  public var flagArguments: [String] {
    [name.camelToSnakeCaseFlag()]
  }

  public var unsafeFlagArguments: [String] {
    ["-Xfrontend", flagArguments.joined(separator: "=")]
  }
}
