#!/bin/sh

echo "// swift-tools-version: 5.9" > Package.swift
cat Support/*.swift >> Package.swift
cat Sources/**/*.swift >> Package.swift
cat Sources/*.swift >> Package.swift