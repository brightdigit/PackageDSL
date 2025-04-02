/// Passes the flag `-allow-non-resilient-access`
///
/// Ensures all contents are generated besides exportable decls in the binary
/// module, so non-resilient access can be allowed
public struct AllowNonResilientAccess: UnsafeFlag {}
