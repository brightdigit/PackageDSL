

struct BushelCommand: Target, Product {
  var targetName: String {
    "bushel"
  }

  var dependencies: any Dependencies {
    BushelArgs()
  }

  var type: ProductType {
    .executable
  }
}
 
