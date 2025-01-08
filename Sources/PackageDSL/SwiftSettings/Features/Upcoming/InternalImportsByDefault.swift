/// A Swift setting feature that defaults imported modules to the `internal` access level.
public struct InternalImportsByDefault: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .upcoming
    }
}
