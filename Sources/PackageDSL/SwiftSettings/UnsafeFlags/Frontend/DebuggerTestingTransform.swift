/// Passes the flag `-debugger-testing-transform`
///  Instrument the code with calls to an intrinsic that record the expected values of local variables so they can be compared against the results from the debugger.
public struct DebuggerTestingTransform: FrontendFlag { }
