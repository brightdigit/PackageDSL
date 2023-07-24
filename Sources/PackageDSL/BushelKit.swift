import PackageDescription

let package = Package{
  BushelLibraryApp()
  BushelMachineApp()
  BushelSettingsApp()
  BushelApp()
}
.supportedPlatforms {
  WWDC2023()
}
.defaultLocalization(.english)
 
