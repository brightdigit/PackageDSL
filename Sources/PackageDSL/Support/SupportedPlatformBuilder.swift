import PackageDescription

@resultBuilder
enum SupportedPlatformBuilder {
  static func buildPartialBlock(first: _PackageDescription_SupportedPlatform) -> any SupportedPlatforms {
    [first    ]
  }
  static func buildPartialBlock(first: PlatformSet) -> any SupportedPlatforms {
    return first.body
  }
  
  
  static func buildPartialBlock(first: any SupportedPlatforms) -> any SupportedPlatforms  {
    first
  }

  static func buildPartialBlock(accumulated: any SupportedPlatforms, next: any SupportedPlatforms) -> any SupportedPlatforms {
    accumulated.appending(next)
  }
  
  static func buildPartialBlock(accumulated: any SupportedPlatforms, next: _PackageDescription_SupportedPlatform) -> any SupportedPlatforms {
    accumulated.appending([next])
  }
}

 
