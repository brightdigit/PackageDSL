
/// Extends the `_PackageDescription_Product` type.
extension _PackageDescription_Product {
    /// Creates a new `_PackageDescription_Product` instance based on the provided `Product`.
    /// - Parameter entry: The `Product` instance to be used for creating the new `_PackageDescription_Product`.
    /// - Returns: A new `_PackageDescription_Product` instance.
    static func entry(_ entry: any Product) -> _PackageDescription_Product {
        let targets = entry.productTargets.map(\.name)

        switch entry.productType {
        case .executable:
            return Self.executable(name: entry.name, targets: targets)
        case .library:
            return Self.library(name: entry.name, type: entry.libraryType, targets: targets)
        }
    }
}
