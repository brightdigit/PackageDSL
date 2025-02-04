/// Passes the flag `-print-inst-counts`
///
/// Before IRGen, count all the various SIL instructions. Must be used in
/// conjunction with -print-stats.
public struct PrintInstCounts: FrontendFlag {}
