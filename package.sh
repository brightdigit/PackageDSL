#!/bin/sh

echo "// swift-tools-version: 5.9" > Package.swift
find Support -name '*.swift' -type f -exec cat {} + >> Package.swift
cat Sources/**/*.swift >> Package.swift
cat Sources/*.swift >> Package.swift