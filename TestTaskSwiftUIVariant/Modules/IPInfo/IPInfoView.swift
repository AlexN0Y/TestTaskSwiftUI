//
//  IPInfoView.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 24.10.2024.
//

import SwiftUI
import MapKit

struct IPInfoView: View {
    
    @StateObject private var viewModel = IPInfoViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                mapView
                infoView
                reloadButton
                
                Spacer()
            }
            .padding(.bottom, 20)
        }
        .scrollIndicators(.hidden)
        .alert(isPresented: $viewModel.showErrorMessage) {
            Alert(
                title: Text(String(localized: "Error")),
                message: Text(String(localized: "Unable to fetch IP info and no cached data available.")),
                dismissButton: .default(Text(String(localized: "OK")))
            )
        }
        .refreshable { await viewModel.fetchIPInfo() }
        .task { await viewModel.fetchIPInfo(forceReload: false) }
    }
}

private extension IPInfoView {
    
    @ViewBuilder
    var mapView: some View {
        if viewModel.locations.isEmpty {
            ProgressView()
                .frame(height: 250)
        } else {
            Map(
                coordinateRegion: $viewModel.region,
                annotationItems: viewModel.locations
            ) { location in
                MapMarker(
                    coordinate: location.coordinate,
                    tint: .red
                )
            }
            .frame(height: 250)
            .padding(.bottom, 40)
        }
    }
    
    @ViewBuilder
    var infoView: some View {
        if let ipInfo = viewModel.ipInfo {
            LazyVStack(alignment: .leading, spacing: 18) {
                ForEach(ipInfo.arrayRepresentation, id: \.0) { field, response in
                    Text("\(field): \(response)")
                        .padding(.horizontal)
                        .animatedAppear()
                }
            }
            .animation(.easeInOut(duration: 0.3), value: ipInfo)
        } else {
            ProgressView()
        }
    }
    
    var reloadButton: some View {
        Button(action: {
            Task {
                await viewModel.fetchIPInfo()
            }
        }) {
            Text(String(localized: "Reload"))
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    IPInfoView()
}
