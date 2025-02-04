/// Passes the flag `-nonlib-dependency-scanner`
///
/// Use calls to `swift-frontend -scan-dependencies` instead of dedicated
/// dependency scanning library
public struct NonlibDependencyScanner: UnsafeFlag {}
