/// Passes the flag `-migrate-keep-objc-visibility`
/// When migrating, add '@objc' to declarations that would've been implicitly
/// visible in Swift 3
public struct MigrateKeepObjcVisibility: UnsafeFlag {}
