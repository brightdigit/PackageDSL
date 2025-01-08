/// Enables the "bare slash regex" feature in the Swift compiler.
///
/// This is an `UnsafeFlag` that should be used with caution, as it may introduce
/// unexpected behavior or security vulnerabilities. It is recommended to only
/// use this flag when necessary and with a thorough understanding of its implications.
public struct EnableBareSlashRegex: UnsafeFlag {}
