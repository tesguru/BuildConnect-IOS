import Foundation
import PhoneNumberKit

final class PhoneService {
    static let shared = PhoneService()

    private let utility = PhoneNumberUtility()

    lazy var countries: [Country] = {
        Locale.Region.isoRegions
            .map { $0.identifier }
            .compactMap { code -> Country? in
                guard let dial = utility.countryCode(for: code), dial > 0 else { return nil }
                let name = Locale.current.localizedString(forRegionCode: code) ?? code
                return Country(id: code, name: name, dialCode: "+\(dial)")
            }
            .sorted { $0.name < $1.name }
    }()

    var nigeria: Country {
        countries.first { $0.id == "NG" } ?? Country(id: "NG", name: "Nigeria", dialCode: "+234")
    }

    func isValid(_ number: String, country: Country) -> Bool {
        (try? utility.parse(number, withRegion: country.id)) != nil
    }
}
