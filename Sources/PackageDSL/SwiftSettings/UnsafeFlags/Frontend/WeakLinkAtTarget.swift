/// Passes the flag `-weak-link-at-target`
/// Weakly link symbols for declarations that were introduced at the deployment target. Symbols introduced before the deployment target are still strongly linked.
struct WeakLinkAtTarget: FrontendFlag { }
