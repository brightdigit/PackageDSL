/// Passes the flag `-disable-ast-verifier`
/// Do not run the AST verifier during compilation. NOTE: This lets the user override the default behavior on whether or not the ASTVerifier is run. The default behavior is to run the verifier when asserts are enabled and not run it when asserts are disabled. NOTE: Can not be used if enable-ast-verifier is used as well
public struct DisableAstVerifier: FrontendFlag { }
