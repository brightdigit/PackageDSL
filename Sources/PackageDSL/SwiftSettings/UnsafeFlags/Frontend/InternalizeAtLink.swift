/// Passes the flag `-internalize-at-link`
/// Allow internalizing public symbols and vtables at link time (assume all client
/// code of public types is part of the same link unit, or that external symbols
/// are explicitly requested via -exported_symbols_list)
public struct InternalizeAtLink: FrontendFlag {}
