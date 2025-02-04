/// Passes the flag `-no-clang-include-tree`
///
/// Do not use clang include tree, fallback to use CAS filesystem to build clang
/// modules
public struct NoClangIncludeTree: FrontendFlag {}
