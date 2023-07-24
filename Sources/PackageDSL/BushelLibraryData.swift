

struct BushelLibraryData: Target {
  var dependencies: any Dependencies {
    BushelLibrary()
    BushelLogging()
    BushelDataCore()
  }
}
 
