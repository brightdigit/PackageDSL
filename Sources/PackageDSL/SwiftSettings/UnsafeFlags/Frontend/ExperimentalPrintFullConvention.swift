/// Passes the flag `-experimental-print-full-convention`
///
/// When emitting a module interface or SIL, emit additional @convention
/// arguments, regardless of whether they were written in the source. Also requires
/// -use-clang-function-types to be enabled.
public struct ExperimentalPrintFullConvention: FrontendFlag {}
