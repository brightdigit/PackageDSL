
protocol SwiftSettingFeature : _Named, SwiftSettingConvertible {
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