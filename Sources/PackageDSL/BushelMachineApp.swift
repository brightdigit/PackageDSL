

struct BushelMachineApp: Target, Product {
  var dependencies: any Dependencies {
    BushelMachineViews()
    BushelMachineMacOS()
  }
}
 
