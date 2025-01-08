/// Represents a Swift setting feature for importing Objective-C forward declarations.
public struct ImportObjcForwardDeclarations: SwiftSettingFeature {
    /// The current state of the feature.
    public var featureState: FeatureState {
        return .upcoming
    }
}
