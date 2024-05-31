/// Passes the flag `-enable-ossa-modules`
/// Always serialize SIL in ossa form. If this flag is not passed in, when optimizing ownership will be lowered before serializing SIL
public struct EnableOssaModules: FrontendFlag { }
