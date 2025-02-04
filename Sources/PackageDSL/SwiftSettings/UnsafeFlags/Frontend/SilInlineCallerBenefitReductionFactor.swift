/// Passes the flag `-sil-inline-caller-benefit-reduction-factor`
///
public struct SilInlineCallerBenefitReductionFactor: FrontendFlag {
  public let value: String

  public var flagArguments: [String] {
    ["\(name.camelToSnakeCaseFlag())", "\(value)"]
  }

  public init(_ value: String) {
    self.value = value
  }
}
