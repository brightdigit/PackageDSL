/// Passes the flag `-sil-stop-optzns-before-lowering-ownership`
///  Stop optimizing at SIL time before we lower ownership from SIL. Intended only for SIL ossa tests
struct SilStopOptznsBeforeLoweringOwnership: FrontendFlag { }
