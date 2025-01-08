/// An extension to the `String` type.
extension String {
    /// The package name of the current string, if it is a valid package name.
    ///
    /// Assumes the package name is the last part of the string, separated by periods.
    var packageName: String? {
        split(separator: "/").last?.split(separator: ".").first.map(String.init)
    }

    /// Converts a camel-case string to a snake-case string with a custom separator.
    ///
    /// - Parameter withSeparator: The separator to use between words in the snake-case string. Defaults to "-".
    /// - Returns: The string converted to snake-case using the specified separator.
    func camelToSnakeCaseFlag(withSeparator separator: String = "-") -> String {
        separator
            + enumerated()
            .reduce("") {
                $0 + ($1.offset > 0 && $1.element.isUppercase ? separator : "")
                    + String($1.element).lowercased()
            }
    }
}
