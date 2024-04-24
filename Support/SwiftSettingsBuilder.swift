//
// SwiftSettingsBuilder.swift
// Copyright (c) 2024 BrightDigit.
// Licensed under MIT License
//

protocol SwiftSettingsConvertible {
  func swiftSettings () -> [SwiftSetting]
}

protocol SwiftSettingConvertable : SwiftSettingsConvertible {
  var setting : SwiftSetting { get }
}

extension SwiftSettingConvertable {
  func swiftSettings () -> [SwiftSetting] {
    return [setting]
  }
}

enum FeatureState {
  case upcoming
  case experimental
}

extension FeatureState {
  func swiftSetting(name: String) -> SwiftSetting {
    switch self {
    case .experimental:
        return .enableExperimentalFeature(name)
    case .upcoming:
        return .enableUpcomingFeature(name)
    }
  }
}

 

protocol SwiftSettingFeature : _Named, SwiftSettingConvertable {
  var featureState : FeatureState { get }
}

extension SwiftSettingFeature {
  var featureState : FeatureState {
    return .upcoming
  }
  
  
  var setting : SwiftSetting {
    return self.featureState.swiftSetting(name: name)
  }
}

protocol UnsafeFlag : SwiftSettingConvertable, _Named {
  var unsafeFlagArgument : String { get }
}

func camelToSnakeCase(_ input: String, withSeparator separator : String = "-") -> String {
    return separator + input.enumerated().reduce("") { $0 + ($1.offset > 0 && $1.element.isUppercase ? separator : "") + String($1.element).lowercased() }
}


extension UnsafeFlag {
  var unsafeFlagArgument : String {
    camelToSnakeCase(self.name)
  }
  
  var setting : SwiftSetting {
    .unsafeFlags([self.unsafeFlagArgument])
  }
}

struct WarnConcurrency : UnsafeFlag {
  
}

struct EnableActorDataRaceChecks : UnsafeFlag {
  
}
// https://github.com/search?q=repo%3Aapple%2Fswift-evolution%20%22Upcoming%20Feature%20Flag%3A%22&type=code

// https://github.com/search?q=repo%3Aapple%2Fswift-evolution%20-enable-experimental-feature&type=code

struct BareSlashRegexLiterals : SwiftSettingFeature {}
struct ConciseMagicFile : SwiftSettingFeature {}
struct ExistentialAny : SwiftSettingFeature {}
struct ForwardTrailingClosures : SwiftSettingFeature {}
struct ImplicitOpenExistentials : SwiftSettingFeature {}
struct StrictConcurrency : SwiftSettingFeature {}
struct DisableOutwardActorInference : SwiftSettingFeature {}
struct DynamicActorIsolation : SwiftSettingFeature {}
struct FullTypedThrows : SwiftSettingFeature {}
struct InternalImportsByDef : SwiftSettingFeature {}
struct InferSendableFromCap : SwiftSettingFeature {}
struct IsolatedDefaultValue : SwiftSettingFeature {}
struct DisableOutwardActorI : SwiftSettingFeature {}
struct ImportObjcForwardDec : SwiftSettingFeature {}
struct DeprecateApplication : SwiftSettingFeature {}

@resultBuilder
enum SwiftSettingsBuilder {
  static func buildPartialBlock(first: SwiftSetting) -> [SwiftSetting] {
    [first]
  }

  static func buildPartialBlock(accumulated: [SwiftSetting], next: SwiftSetting) -> [SwiftSetting] {
    accumulated + [next]
  }
  
  static func buildPartialBlock(first: SwiftSettingsConvertible) -> [SwiftSetting] {
    first.swiftSettings()
  }

  static func buildPartialBlock(accumulated: [SwiftSetting], next: SwiftSettingsConvertible) -> [SwiftSetting] {
    accumulated + next.swiftSettings()
  }
}
