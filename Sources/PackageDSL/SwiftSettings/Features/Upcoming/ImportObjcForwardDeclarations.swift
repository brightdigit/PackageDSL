///
/// This proposal seeks to improve the usability of existing Objective-C libraries from Swift by reducing the negative
/// impact forward declarations have on API visibility from Swift. We wish to start synthesizing placeholder types to
/// represent forward declared Objective-C interfaces and protocols in Swift.
///
/// - SeeAlso: [Importing Forward Declared Objective-C Interfaces and Protocols (SE-0384)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0384-importing-forward-declared-objc-interfaces-and-protocols.md)
///
public struct ImportObjcForwardDeclarations : SwiftSettingFeature {
  /// The current state of the feature.
  public var featureState : FeatureState {
    return .upcoming
  }
}
