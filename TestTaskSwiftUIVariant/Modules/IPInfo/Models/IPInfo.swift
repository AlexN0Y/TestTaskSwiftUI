//
//  IPInfo.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 27.10.2024.
//

import CoreLocation

struct IPInfo {
    
    let query: String?
    let status: String?
    let country: String?
    let countryCode: String?
    let region: String?
    let regionName: String?
    let city: String?
    let zip: String?
    let lat: Double?
    let lon: Double?
    let timezone: String?
    let isp: String?
    let org: String?
    let asInfo: String?
    
    var coordinate: CLLocationCoordinate2D? {
        if let lat = lat, let lon = lon {
            return CLLocationCoordinate2D(latitude: lat, longitude: lon)
        }
        
        return nil
    }
    
    var arrayRepresentation: [(String, String)] {
        [
            (String(localized: "IP"), query ?? ""),
            (String(localized: "Status"), status ?? ""),
            (String(localized: "Country"), country ?? ""),
            (String(localized: "Country Code"), countryCode ?? ""),
            (String(localized: "Region"), region ?? ""),
            (String(localized: "Region Name"), regionName ?? ""),
            (String(localized: "City"), city ?? ""),
            (String(localized: "ZIP"), zip ?? ""),
            (String(localized: "Timezone"), timezone ?? ""),
            (String(localized: "ISP"), isp ?? ""),
            (String(localized: "Organization"), org ?? ""),
            (String(localized: "AS"), asInfo ?? "")
        ]
    }
    
}

extension IPInfo: Codable {
    
    enum CodingKeys: String, CodingKey {
        case query, status, country, countryCode, region,
             regionName, city, zip, lat, lon, timezone,
             isp, org
        case asInfo = "as"
    }
}

extension IPInfo: Equatable {}
