/// Passes the flag `-validate-clang-modules-once`
/// Don't verify input files for Clang modules if the module has been successfully
/// validated or loaded during this build session
public struct ValidateClangModulesOnce: UnsafeFlag {}
