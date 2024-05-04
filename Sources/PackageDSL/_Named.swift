//
// _Named.swift
// Copyright (c) 2024 BrightDigit.
//

public protocol _Named {
    var name: String { get }
}

public extension _Named {
    var name: String {
        "\(Self.self)"
    }
}
