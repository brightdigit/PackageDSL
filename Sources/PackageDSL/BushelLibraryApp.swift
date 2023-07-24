

struct BushelLibraryApp: Product, Target {
  var dependencies: any Dependencies {
    BushelLibraryViews()
    BushelLibraryMacOS()
  }
}
 
