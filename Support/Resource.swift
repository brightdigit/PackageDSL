//
// TargetType.swift
// Copyright (c) 2023 BrightDigit.
// Created by Mahmoud Fares
// Licensed under MIT License
//
protocol Resources {
    var resources: [PackageDescription.Resource]? { get }

}
extension Resources {
    var resources: [PackageDescription.Resource]? {
        nil
    }
}
