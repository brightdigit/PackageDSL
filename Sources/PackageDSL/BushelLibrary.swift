

struct BushelLibrary: Target {
  var dependencies: any Dependencies {
    BushelLogging()
    BushelCore()
  }
}
 
