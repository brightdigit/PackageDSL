/// Passes the flag `-explicit-auto-linking`
///
/// Instead of linker-load directives, have the driver specify all link
/// dependencies on the linker invocation. Requires '-explicit-module-build'.
public struct ExplicitAutoLinking: UnsafeFlag {}
