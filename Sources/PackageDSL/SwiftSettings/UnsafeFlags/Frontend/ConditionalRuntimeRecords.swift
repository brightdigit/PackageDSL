/// Passes the flag `-conditional-runtime-records`
///
/// Allow removal of runtime metadata records (public types, protocol
/// conformances) based on whether they're used or unused
public struct ConditionalRuntimeRecords: FrontendFlag {}
