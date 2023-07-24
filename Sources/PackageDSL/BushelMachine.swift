

struct BushelMachine: Target {
  var dependencies: any Dependencies {
    BushelCore()
    BushelLogging()
  }
}
 
