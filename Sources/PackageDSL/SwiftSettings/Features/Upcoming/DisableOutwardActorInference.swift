///
/// [SE-0316: Global Actors](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0316-global-actors.md) introduced annotations like `@MainActor` to isolate a type, function, or property to a particular global actor. It also introduced various rules for how that global actor isolation could be inferred. One of those rules was:
/// > Declarations that are not explicitly annotated with either a global actor or `nonisolated` can infer global actor isolation from several different places:
/// >
/// > [...]
/// > 
/// > - A struct or class containing a wrapped instance property with a global actor-qualified wrappedValue infers actor isolation from that property wrapper:
/// > 
/// >   ```swift 
/// >   @propertyWrapper
/// >   struct UIUpdating<Wrapped> {
/// >     @MainActor var wrappedValue: Wrapped
/// >   }
/// > 
/// >   struct CounterView { // infers @MainActor from use of @UIUpdating
/// >     @UIUpdating var intValue: Int = 0
/// >   }
/// >   ```
/// This proposal advocates for **removing this inference rule** when compiling in the Swift 6 language mode. Given the example above, CounterView would no longer infer `@MainActor` isolation in Swift 6.
///
/// - SeeAlso: [Remove Actor Isolation Inference caused by Property Wrappers (SE-0401)](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0401-remove-property-wrapper-isolation.md)
///
struct DisableOutwardActorInference : SwiftSettingFeature {
  /// The current state of the feature.
  var featureState : FeatureState {
    return .upcoming
  }
}
