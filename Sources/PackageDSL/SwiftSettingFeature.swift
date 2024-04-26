import PackageDescription

public protocol SwiftSettingFeature : _Named, SwiftSettingConvertible {
  var featureState : FeatureState { get }
}

extension SwiftSettingFeature {
  public var featureState : FeatureState {
    return .upcoming
  }
  
  
  public var setting : SwiftSetting {
    return self.featureState.swiftSetting(name: name)
  }
}
