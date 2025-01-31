/// Passes the flag `-sanitize-address-use-odr-indicator`
///  When using AddressSanitizer enable ODR indicator globals to avoid false ODR violation reports in partially sanitized programs at the cost of an increase in binary size
struct SanitizeAddressUseOdrIndicator: UnsafeFlag { }
