/// Passes the flag `-no-clang-module-breadcrumbs`
///  Don't emit DWARF skeleton CUs for imported Clang modules. Use this when building a redistributable static archive.
struct NoClangModuleBreadcrumbs: FrontendFlag { }
