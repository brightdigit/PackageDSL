/// Passes the flag `-disable-ios-inheritance-for-pound-if-os-on-visionos`
/// Disable '#if os(iOS)' returning 'true' when targeting visionOS against the
/// Internal SDK
public struct DisableIosInheritanceForPoundIfOsOnVisionos: FrontendFlag {}
