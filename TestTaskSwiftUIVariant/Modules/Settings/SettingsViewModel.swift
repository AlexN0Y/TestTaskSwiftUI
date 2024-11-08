//
//  SettingsViewModel.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 27.10.2024.
//

import SwiftUI
import StoreKit

@MainActor
final class SettingsViewModel: ObservableObject {
    
    @Published private(set) var settingsOptions = SettingsOption.allCases
}

extension SettingsViewModel {
    
    func didTapOption(_ option: SettingsOption) {
        switch option {
        case .rateApp:
            rateApp()
        case .shareApp:
            shareApp()
        case .contactUs:
            contactUs()
        }
    }
}

private extension SettingsViewModel {
    
    func rateApp() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            AppStore.requestReview(in: scene)
        }
    }
    
    func shareApp() {
        let items = ["Check out this app!", "Here will be app link"]
        
        let viewController = UIActivityViewController(
            activityItems: items,
            applicationActivities: nil
        )
        
        UIApplication.shared.topViewController?
            .present(viewController, animated: true)
    }
    
    func contactUs() {
        if let url = URL(string: "https://healthy-metal-aa6.notion.site/iOS-Developer-12831b2ac19680068ac3fcd91252b819#12831b2ac19680a49f65d3984ccf55b1") {
            UIApplication.shared.open(url)
        }
    }
}
