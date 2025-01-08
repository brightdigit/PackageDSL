import PackageDescription


/// A builder for `SupportedPlatforms`.
@resultBuilder public enum SupportedPlatformBuilder {
    /// Builds a partial block of `SupportedPlatforms` from a single `SupportedPlatform`.
    ///
    /// - Parameter first: A `SupportedPlatform` to include in the partial block.
    /// - Returns: A partial block of `SupportedPlatforms` containing the provided `SupportedPlatform`.
    public static func buildPartialBlock(first: SupportedPlatform) -> any SupportedPlatforms {
        [first]
    }

    /// Builds a partial block of `SupportedPlatforms` from a `PlatformSet`.
    ///
    /// - Parameter first: A `PlatformSet` to include in the partial block.
    /// - Returns: A partial block of `SupportedPlatforms` containing the `SupportedPlatforms` from the provided `PlatformSet`.
    public static func buildPartialBlock(first: PlatformSet) -> any SupportedPlatforms {
        first.body
    }

    /// Builds a partial block of `SupportedPlatforms` from an existing `SupportedPlatforms` instance.
    ///
    /// - Parameter first: A `SupportedPlatforms` instance to include in the partial block.
    /// - Returns: The provided `SupportedPlatforms` instance.
    public static func buildPartialBlock(first: any SupportedPlatforms) -> any SupportedPlatforms {
        first
    }

    /// Builds a partial block of `SupportedPlatforms` by appending one set of `SupportedPlatforms` to another.
    ///
    /// - Parameters:
    ///   - accumulated: The `SupportedPlatforms` to which the next set will be appended.
    ///   - next: The `SupportedPlatforms` to append to the accumulated set.
    /// - Returns: The `SupportedPlatforms` with the next set appended.
    public static func buildPartialBlock(
        accumulated: any SupportedPlatforms,
        next: any SupportedPlatforms
    ) -> any SupportedPlatforms {
        accumulated.appending(next)
    }

    /// Builds a partial block of `SupportedPlatforms` by appending a single `SupportedPlatform` to an existing set of `SupportedPlatforms`.
    ///
    /// - Parameters:
    ///   - accumulated: The `SupportedPlatforms` to which the `SupportedPlatform` will be appended.
    ///   - next: The `SupportedPlatform` to append to the accumulated set.
    /// - Returns: The `SupportedPlatforms` with the `SupportedPlatform` appended.
    public static func buildPartialBlock(
        accumulated: any SupportedPlatforms,
        next: SupportedPlatform
    ) -> any SupportedPlatforms {
        accumulated.appending([next])
    }
}
