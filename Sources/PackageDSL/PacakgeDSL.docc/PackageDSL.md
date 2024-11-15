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

- ``Symbol``
protocol Dependencies
protocol Dependency
protocol GroupBuildable
protocol Product
protocol SupportedPlatforms
protocol SwiftSettingConvertible
protocol SwiftSettingFeature
protocol SwiftSettingsConvertible
protocol Target
protocol TestTarget
protocol TestTargets
protocol UnsafeFlag

struct AccessLevelOnImport
struct ApplicationExtension
struct AvoidEmitModuleSourceInfo
struct BitwiseCopyable
struct CacheCompileJob
struct CacheDisableReplay
struct ColorDiagnostics
struct ContinueBuildingAfterErrors
struct DebugInfoStoreInvocation
struct DeprecateApplicationMain
struct DisableActorDataRaceChecks
struct DisableAutolinkingRuntimeCompatibility
struct DisableAutolinkingRuntimeCompatibilityConcurrency
struct DisableAutolinkingRuntimeCompatibilityDynamicReplacements
struct DisableClangTarget
struct DisableIncrementalImports
struct DisableMigratorFixits
struct DisableOnlyOneDependencyFile
struct DisableOutwardActorInference
struct DisableSandbox
struct DisallowUseNewDriver
struct DriverTimeCompilation
struct DumpAst
struct DumpParse
struct DumpPcm
struct DumpTypeInfo
struct DumpTypeRefinementContexts
struct DumpUsr
struct DynamicActorIsolation
struct EmbedBitcode
struct EmbedBitcodeMarker
struct EmitAssembly
struct EmitBc
struct EmitClangHeaderNonmodularIncludes
struct EmitDependencies
struct EmitDigesterBaseline
struct EmitExecutable
struct EmitImportedModules
struct EmitIr
struct EmitIrgen
struct EmitLibrary
struct EmitLoadedModuleTrace
struct EmitModule
struct EmitModuleInterface
struct EmitModuleSummary
struct EmitObjcHeader
struct EmitObject
struct EmitPcm
struct EmitSib
struct EmitSibgen
struct EmitSil
struct EmitSilgen
struct EmitSupportedFeatures
struct EmitTbd
struct EnableActorDataRaceChecks
struct EnableAutolinkingRuntimeCompatibilityBytecodeLayouts
struct EnableBareSlashRegex
struct EnableBuiltinModule
struct EnableExperimentalAdditiveArithmeticDerivation
struct EnableExperimentalConcisePoundFile
struct EnableExperimentalForwardModeDifferentiation
struct EnableIncrementalImports
struct EnableLibraryEvolution
struct EnableOnlyOneDependencyFile
struct FixitAll
struct FullTypedThrows
struct G
struct GdwarfTypes
struct GlineTablesOnly
struct GlobalActorIsolatedTypesUsability
struct GlobalConcurrency
struct Gnone
struct Group
struct Help
struct ImportObjcForwardDeclarations
struct ImportUnderlyingModule
struct IndexFile
struct IndexIgnoreClangModules
struct IndexIgnoreSystemModules
struct IndexIncludeLocals
struct InferSendableFromCaptures
struct InternalImportsByDefault
struct IsolatedAny
struct IsolatedDefaultValues
struct LinkObjcRuntime
struct MigrateKeepObjcVisibility
struct MigratorUpdateSdk
struct MigratorUpdateSwift
struct MoveOnlyPartialConsumption
struct NestedProtocols
struct NoColorDiagnostics
struct NoVerifyEmittedModuleInterface
struct NoWarningsAsErrors
struct NoWholeModuleOptimization
struct NoncopyableGenerics
struct Nostdimport
struct O
struct Onone
struct Osize
struct Ounchecked
struct Parse
struct ParseAsLibrary
struct ParseSil
struct ParseableOutput
struct PrefixSerializedDebuggingOptions
struct PrettyPrint
struct PrintAst
struct PrintAstDecl
struct PrintEducationalNotes
struct PrintTargetInfo
struct ProfileCoverageMapping
struct ProfileGenerate
struct RcacheCompileJob
struct RcrossImport
struct RegionBasedIsolation
struct RemoveRuntimeAsserts
struct RequireExplicitAvailability
struct RequireExplicitSendable
struct ResolveImports
struct RindexingSystemModule
struct RmacroLoading
struct RmoduleLoading
struct RmoduleRecovery
struct RskipExplicitInterfaceBuild
struct SaveOptimizationRecord
struct SaveTemps
struct ScanDependencies
struct SerializeDiagnostics
struct Static
struct StaticExecutable
struct StaticStdlib
struct StrictConcurrency
struct SuppressRemarks
struct SuppressWarnings
struct TrackSystemDependencies
struct TransferringArgsAndResults
struct Typecheck
struct V
struct ValidateClangModulesOnce
struct VariadicGenerics
struct VerifyDebugInfo
struct VerifyEmittedModuleInterface
struct Version
struct WarnConcurrency
struct WarnImplicitOverrides
struct WarnSwift3ObjcInferenceComplete
struct WarnSwift3ObjcInferenceMinimal
struct WarningsAsErrors
struct WholeModuleOptimization

enum FeatureState
enum GroupBuilder
enum ProductType
enum ProductsBuilder
enum SwiftSettingsBuilder
enum TargetType

