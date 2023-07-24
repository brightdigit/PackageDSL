

struct BushelMachineData: Target {
  var dependencies: any Dependencies {
    BushelDataCore()
    BushelMachine()
    BushelLogging()
  }
}
 
