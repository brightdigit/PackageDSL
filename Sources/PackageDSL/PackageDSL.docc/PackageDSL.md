# ``PackageDSL``

Defining Swift Packages using Result Builders.

## Overview

Swift Packages are a great way to deliver the bulk of your app as well as share a piece of functionality or code. However there are times when your code base and therefore your Swift Package could grow especially if your targets are small pieces of functionality.

**PackageDSL** creates an easy to use DSL for dividing, organizing, and creating new Swift Packages.

* Only refer to targets and dependencies once.
* Easily apply Swift Settings and Unsafe Flags throughout a Swift Package.
* Keep your targets organized and easy to reference.

```
import PackageDescription

let package = Package(
  entries: {
    BushelUITests()
    BushelLibraryApp()
    BushelMachineApp()
    BushelSettingsApp()
    BushelApp()
    BushelService()
  },
  testTargets: {
    BushelServiceTests()
    BushelSessionTests()
  },
  swiftSettings: {
    Group("Experimental") {
      AccessLevelOnImport()
      BitwiseCopyable()
      GlobalActorIsolatedTypesUsability()
      IsolatedAny()
      MoveOnlyPartialConsumption()
      NestedProtocols()
      NoncopyableGenerics()
      RegionBasedIsolation()
      TransferringArgsAndResults()
      VariadicGenerics()
    }
    Group("Upcoming") {
      FullTypedThrows()
      InternalImportsByDefault()
    }
    WarnLongFunctionBodies(milliseconds: 100)
    WarnLongExpressionTypeChecking(milliseconds: 100)
  }
)
.supportedPlatforms {
  WWDC2023()
}
.defaultLocalization(.english)
```

## Topics

### Getting Started

- ``PackageDescription/Package``
- ``Product``
- ``Target``
- ``Dependency``
- ``Dependencies``
- ``TestTarget``
- ``TestTargets``
- ``SupportedPlatforms``
- ``SwiftSettingConvertible``
- ``SwiftSettingFeature``
- ``SwiftSettingsConvertible``
- ``UnsafeFlag``
- ``FeatureState``
- ``ProductType``
- ``TargetType``
- ``PackageDependency``
- ``PlatformSet``
- ``Group``
- ``LibraryType``

### Builders

- ``ProductsBuilder``
- ``GroupBuilder``
- ``SwiftSettingsBuilder``
- ``GroupBuildable``
- ``DependencyBuilder``
- ``PackageDependencyBuilder``
- ``ResourcesBuilder``
- ``SupportedPlatformBuilder``
- ``TestTargetBuilder``

### Swift Settings

- ``GlobalActorIsolatedTypesUsability``
- ``RegionBasedIsolation``
- ``TransferringArgsAndResults``
- ``AccessLevelOnImport``
- ``NestedProtocols``
- ``VariadicGenerics``
- ``BitwiseCopyable``
- ``NoncopyableGenerics``
- ``MoveOnlyPartialConsumption``
- ``IsolatedAny``
- ``StrictConcurrency``
- ``GlobalConcurrency``
- ``InferSendableFromCaptures``
- ``DeprecateApplicationMain``
- ``FullTypedThrows``
- ``ImportObjcForwardDeclarations``
- ``DynamicActorIsolation``
- ``IsolatedDefaultValues``
- ``InternalImportsByDefault``
- ``DisableOutwardActorInference``

### Unsafe Flags

- ``Ounchecked``
- ``ParseableOutput``
- ``EmitObjcHeader``
- ``EnableLibraryEvolution``
- ``WarnLongExpressionTypeChecking``
- ``DisableIncrementalImports``
- ``WarnImplicitOverrides``
- ``ParseSil``
- ``ValidateClangModulesOnce``
- ``EmitModuleSummary``
- ``PrintAstDecl``
- ``TrackSystemDependencies``
- ``DisableAutolinkingRuntimeCompatibility``
- ``DumpTypeRefinementContexts``
- ``GlineTablesOnly``
- ``EmitSil``
- ``IndexFile``
- ``EmitSilgen``
- ``EmitAssembly``
- ``DisableClangTarget``
- ``DisableSandbox``
- ``ImportUnderlyingModule``
- ``Static``
- ``EmitClangHeaderNonmodularIncludes``
- ``SaveOptimizationRecord``
- ``RcacheCompileJob``
- ``WarnLongFunctionBodies``
- ``DisableAutolinkingRuntimeCompatibilityConcurrency``
- ``RmoduleRecovery``
- ``EmitIr``
- ``V``
- ``WarnConcurrency``
- ``O``
- ``EmitBc``
- ``EmitDigesterBaseline``
- ``Nostdimport``
- ``RmacroLoading``
- ``IndexIgnoreClangModules``
- ``EnableAutolinkingRuntimeCompatibilityBytecodeLayouts``
- ``Typecheck``
- ``EmitPcm``
- ``ScanDependencies``
- ``DisableAutolinkingRuntimeCompatibilityDynamicReplacements``
- ``MigrateKeepObjcVisibility``
- ``ApplicationExtension``
- ``RindexingSystemModule``
- ``Help``
- ``Version``
- ``DumpPcm``
- ``ParseAsLibrary``
- ``RskipExplicitInterfaceBuild``
- ``NoWarningsAsErrors``
- ``EmitObject``
- ``FixitAll``
- ``CacheDisableReplay``
- ``WarningsAsErrors``
- ``EnableIncrementalImports``
- ``SaveTemps``
- ``EnableBuiltinModule``
- ``EmbedBitcode``
- ``EmitModule``
- ``GdwarfTypes``
- ``Gnone``
- ``DisableActorDataRaceChecks``
- ``PrettyPrint``
- ``EmitModuleInterface``
- ``EnableExperimentalAdditiveArithmeticDerivation``
- ``DumpParse``
- ``EmitTbd``
- ``ColorDiagnostics``
- ``Onone``
- ``EmitExecutable``
- ``ResolveImports``
- ``ContinueBuildingAfterErrors``
- ``StaticExecutable``
- ``IndexIncludeLocals``
- ``StaticStdlib``
- ``DisableOnlyOneDependencyFile``
- ``SuppressRemarks``
- ``NoVerifyEmittedModuleInterface``
- ``CacheCompileJob``
- ``ProfileGenerate``
- ``EnableOnlyOneDependencyFile``
- ``PrintEducationalNotes``
- ``RcrossImport``
- ``NoColorDiagnostics``
- ``Osize``
- ``VerifyDebugInfo``
- ``EnableActorDataRaceChecks``
- ``WarnSwift3ObjcInferenceComplete``
- ``EnableBareSlashRegex``
- ``VerifyEmittedModuleInterface``
- ``SerializeDiagnostics``
- ``ProfileCoverageMapping``
- ``EmitLoadedModuleTrace``
- ``PrefixSerializedDebuggingOptions``
- ``EmitSupportedFeatures``
- ``PrintTargetInfo``
- ``MigratorUpdateSwift``
- ``EmbedBitcodeMarker``
- ``EmitIrgen``
- ``AvoidEmitModuleSourceInfo``
- ``SuppressWarnings``
- ``WarnSwift3ObjcInferenceMinimal``
- ``LinkObjcRuntime``
- ``MigratorUpdateSdk``
- ``EmitImportedModules``
- ``DisableMigratorFixits``
- ``RmoduleLoading``
- ``DriverTimeCompilation``
- ``RequireExplicitSendable``
- ``EmitDependencies``
- ``WholeModuleOptimization``
- ``EmitSibgen``
- ``IndexIgnoreSystemModules``
- ``DebugInfoStoreInvocation``
- ``EnableExperimentalForwardModeDifferentiation``
- ``Parse``
- ``EmitLibrary``
- ``RequireExplicitAvailability``
- ``DumpAst``
- ``NoWholeModuleOptimization``
- ``PrintAst``
- ``G``
- ``EmitSib``
- ``DumpUsr``
- ``RemoveRuntimeAsserts``
- ``EnableExperimentalConcisePoundFile``
- ``DumpTypeInfo``
- ``DisallowUseNewDriver``
