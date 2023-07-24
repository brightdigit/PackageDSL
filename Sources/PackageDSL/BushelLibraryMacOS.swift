

struct BushelLibraryMacOS: Target {
  var dependencies: any Dependencies {
    BushelLibrary()
    BushelMacOSCore()
  }
}
 
