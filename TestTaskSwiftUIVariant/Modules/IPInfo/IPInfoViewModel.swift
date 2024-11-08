//
//  IPInfoViewModel.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 27.10.2024.
//

import SwiftUI
import MapKit
import Alamofire

@MainActor
final class IPInfoViewModel: ObservableObject {
    
    @Published var ipInfo: IPInfo?
    @Published var locations = [Location]()
    @Published var showErrorMessage = false
    @Published var isLoading: Bool = false
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2DMake(0, 0),
        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
    )
    
    private let cacheKey = "IPInfoCache"
}

extension IPInfoViewModel {
    
    func fetchIPInfo(forceReload: Bool = true) async {
        guard !isLoading, forceReload || ipInfo == nil else { return }
        
        isLoading = true
        do {
            ipInfo = nil
            
            let ipInfo = try await AF.request("http://ip-api.com/json/")
                .serializingDecodable(IPInfo.self)
                .value
            
            self.ipInfo = ipInfo
            updateLocations()
            updateRegion()
            
            if let data = try? JSONEncoder().encode(ipInfo) {
                UserDefaults.standard.set(data, forKey: self.cacheKey)
            }
            
            isLoading = false
        } catch {
            print("Error fetching IP info: \(error.localizedDescription)")
            loadFromCache()
        }
    }
}

private extension IPInfoViewModel {
    
    func loadFromCache() {
        if let cachedData = UserDefaults.standard.data(forKey: cacheKey),
           let cachedIPInfo = try? JSONDecoder().decode(IPInfo.self, from: cachedData) {
            ipInfo = cachedIPInfo
            updateLocations()
            updateRegion()
        } else {
            showErrorMessage = true
        }
        
        isLoading = false
    }
    
    func updateLocations() {
        if let coordinate = ipInfo?.coordinate {
            locations = [Location(coordinate: coordinate)]
        }
    }
    
    func updateRegion() {
        if let coordinate = ipInfo?.coordinate {
            region = MKCoordinateRegion(
                center: coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            )
        }
    }
}
