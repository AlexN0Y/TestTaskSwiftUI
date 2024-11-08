//
//  TabItem.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 27.10.2024.
//

import SwiftUI

enum TabItem: String {
    
    case timer
    case ipInfo
    case settings
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .timer:
            String(localized: "Timer")
        case .ipInfo:
            String(localized: "IP section")
        case .settings:
            String(localized: "Settings")
        }
    }
    
    var systemImage: String {
        switch self {
        case .timer:
            "clock"
        case .ipInfo:
            "globe"
        case .settings:
            "gear"
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .timer:
            TimerView()
        case .ipInfo:
            IPInfoView()
        case .settings:
            SettingsView()
        }
    }
}

extension TabItem: CaseIterable {}

extension TabItem: Identifiable {}
