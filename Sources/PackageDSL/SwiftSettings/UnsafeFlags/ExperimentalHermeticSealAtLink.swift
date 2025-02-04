/// Passes the flag `-experimental-hermetic-seal-at-link`
///
/// Library code can assume that all clients are visible at linktime, and
/// aggressively strip unused code
public struct ExperimentalHermeticSealAtLink: UnsafeFlag {}
