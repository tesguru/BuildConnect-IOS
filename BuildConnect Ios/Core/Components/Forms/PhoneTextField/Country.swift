import Foundation

struct Country: Identifiable, Hashable {
    let id: String        // "NG"
    let name: String      // "Nigeria"
    let dialCode: String  // "+234"

    var flag: String {
        id.uppercased().unicodeScalars
            .compactMap { UnicodeScalar(127397 + $0.value) }
            .map { String($0) }
            .joined()
    }
}
