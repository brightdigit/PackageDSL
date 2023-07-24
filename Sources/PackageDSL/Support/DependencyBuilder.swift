

@resultBuilder
enum DependencyBuilder {
  static func buildPartialBlock(first: Dependency) -> any Dependencies {
    [first]
  }

  static func buildPartialBlock(accumulated: any Dependencies, next: Dependency) -> any Dependencies {
    accumulated + [next]
  }
}

protocol _Depending {
  @DependencyBuilder
  var dependencies: any Dependencies { get }
}

extension _Depending {
  var dependencies: any Dependencies {
    Array<Dependency>()
  }
}

extension _Depending {
  func allDependencies() -> [Dependency] {
    self.dependencies.compactMap {
      $0 as? _Depending
    }.flatMap {
      $0.allDependencies()
    }
  }
}
 
