/// Passes the flag `-enable-copy-propagation`
/// Run SIL copy propagation with lexical lifetimes to shorten object lifetimes
/// while preserving variable lifetimes.
public struct EnableCopyPropagation: FrontendFlag {}
