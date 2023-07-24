

protocol Product: _Named {
  var productTargets: [Target] { get }
  var type: ProductType { get }
}

extension Product {
  var type: ProductType {
    .library
  }
}

 
