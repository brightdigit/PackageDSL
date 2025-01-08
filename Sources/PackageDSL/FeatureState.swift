
import PackageDescription
/// Represents the state of a feature in the application.
public enum FeatureState {
    /// The feature is upcoming and not yet available for use.
    case upcoming
    /// The feature is experimental and may have incomplete or unstable functionality.
    case experimental
}

extension FeatureState {
    /// Creates a `SwiftSetting` based on the `FeatureState`.
    ///
    /// - Parameter name: The name of the feature.
    /// - Returns: A `SwiftSetting` that enables the feature based on its state.
    public func swiftSetting(name: String) -> SwiftSetting {
        switch self {
        case .experimental:
            return .enableExperimentalFeature(name)
        case .upcoming:
            return .enableUpcomingFeature(name)
        }
    }
}
