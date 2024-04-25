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
