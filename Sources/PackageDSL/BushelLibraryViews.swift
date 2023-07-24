

struct BushelLibraryViews: Target {
  var dependencies: any Dependencies {
    BushelLibrary()
    BushelLibraryData()
    BushelLogging()
    BushelUT()
    BushelViewsCore()
  }
}
 
