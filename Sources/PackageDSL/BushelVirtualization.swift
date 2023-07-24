

struct BushelVirtualization: Target {
  var dependencies: any Dependencies {
    BushelLibraryMacOS()
    BushelMachineMacOS()
  }
}
 
