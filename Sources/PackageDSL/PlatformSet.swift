
/// A protocol that defines a set of supported platforms.
public protocol PlatformSet {
    /// The set of supported platforms, defined using the `@SupportedPlatformBuilder`.
    @SupportedPlatformBuilder
    var body: any SupportedPlatforms { get }
}
