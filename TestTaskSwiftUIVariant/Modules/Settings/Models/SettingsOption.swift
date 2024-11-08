//
//  SettingsOption.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 27.10.2024.
//

import Foundation

enum SettingsOption {
    
    case rateApp
    case shareApp
    case contactUs
    
    var id: String {
        UUID().uuidString
    }
    
    var title: String {
        switch self {
        case .rateApp:
            String(localized: "Rate App")
        case .shareApp:
            String(localized: "Share App")
        case .contactUs:
            String(localized: "Contact Us")
        }
    }
    
    var systemImageName: String {
        switch self {
        case .rateApp:
            "star"
        case .shareApp:
            "arrowshape.turn.up.right"
        case .contactUs:
            "mail.stack"
        }
    }
}

extension SettingsOption: Identifiable {}

extension SettingsOption: CaseIterable {}
