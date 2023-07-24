

struct BushelViewsCore: Target {
  var dependencies: any Dependencies {
    BushelLogging()
    BushelUT()
  }
}
 
