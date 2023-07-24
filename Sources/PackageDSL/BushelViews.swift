

struct BushelViews: Target {
  var dependencies: any Dependencies {
    BushelLibraryViews()
    BushelMachineViews()
    BushelSettingsViews()
  }
}
 
