//
//  Location.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 27.10.2024.
//

import CoreLocation

struct Location: Identifiable {
    
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}
