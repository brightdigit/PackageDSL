/// Passes the flag `-disable-noreturn-prediction`
///
/// Disables optimization assumption that calls to no-return functions are cold.
public struct DisableNoreturnPrediction: FrontendFlag {}
