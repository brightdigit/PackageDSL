

struct BushelMachineMacOS: Target {
  var dependencies: any Dependencies {
    BushelMachine()
    BushelMacOSCore()
  }
}
 
