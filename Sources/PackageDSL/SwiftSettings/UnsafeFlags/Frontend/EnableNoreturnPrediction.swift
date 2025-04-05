/// Passes the flag `-enable-noreturn-prediction`
///
/// Enables optimization assumption that calls to no-return functions are cold.
public struct EnableNoreturnPrediction: FrontendFlag {}
