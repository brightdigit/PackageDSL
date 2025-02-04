/// Passes the flag `-disable-named-lazy-import-as-member-loading`
/// Import all of a type's import-as-member globals together, as Swift 5.10 and
/// earlier did; temporary workaround for modules that are sensitive to this change
public struct DisableNamedLazyImportAsMemberLoading: FrontendFlag {}
