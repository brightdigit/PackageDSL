/// `AccessLevelOnImport` is a `SwiftSettingFeature` that represents a feature related to access level on imports.
public struct AccessLevelOnImport: SwiftSettingFeature {
    /// The feature state of the `AccessLevelOnImport` struct, which is always `.experimental`.
    public var featureState: FeatureState {
        return .experimental
    }
}
