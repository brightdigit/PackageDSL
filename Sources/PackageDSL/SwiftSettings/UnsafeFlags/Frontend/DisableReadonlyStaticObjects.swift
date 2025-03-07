/// Passes the flag `-disable-readonly-static-objects`
///
/// Avoid allocating static objects in a read-only data section
public struct DisableReadonlyStaticObjects: FrontendFlag {}
