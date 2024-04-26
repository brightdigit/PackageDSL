
import PackageDescription

public enum FeatureState {
  case upcoming
  case experimental
}

extension FeatureState {
  public func swiftSetting(name: String) -> SwiftSetting {
    switch self {
    case .experimental:
        return .enableExperimentalFeature(name)
    case .upcoming:
        return .enableUpcomingFeature(name)
    }
  }
}
