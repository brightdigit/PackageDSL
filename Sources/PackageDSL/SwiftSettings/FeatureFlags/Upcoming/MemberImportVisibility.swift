// swiftlint:disable line_length
///
/// In Swift, there are rules dictating whether the name of a declaration in another module is considered in scope.
///
///  For example, if you have a program that uses the `swift-algorithms` package and you want to use the global function [chain()](https://github.com/apple/swift-algorithms/blob/33abb694280321a84aa7dc9806de284afb8ca226/Sources/Algorithms/Chain.swift#L287) then you must write `import Algorithms` in the file that references that function or the compiler will consider it out of scope:
/// ``` swift
/// // Missing 'import Algorithms'
/// let chained = chain([1], [2]) // error: Cannot find 'chain' in scope
/// ```
/// The visibility rules for a member declaration, such as a method declared inside of a struct, are different though. When resolving a name to a member declaration, the member is in scope even if the module introducing the member is only *transitively* imported. A transitively imported module could be imported directly in another source file, or it could be a dependency of some direct dependency of your program. This inconsistency may be best understood as a subtle bug rather than an intentional design decision, and in a lot of Swift code it goes unnoticed. However, the import rules for members become more surprising when you consider the members of extensions, since an extension and its nominal type can be declared in different modules.
/// This proposal unifies the behavior of name lookup by changing the rules to bring both top-level declarations and members into scope using the same criteria.
///
/// - SeeAlso: [Member import visibility (SE-0444)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0444-member-import-visibility.md)
///
public struct MemberImportVisibility: SwiftSettingFeature {
  // swiftlint:enable line_length
  /// The current state of the feature.
  public var featureState: FeatureState {
    .upcoming
  }
}
