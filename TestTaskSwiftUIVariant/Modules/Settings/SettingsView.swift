//
//  SettingsView.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 24.10.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(viewModel.settingsOptions) { option in
                    SettingsButton(
                        title: option.title,
                        systemImageName: option.systemImageName
                    ) {
                        viewModel.didTapOption(option)
                    }
                    
                    Divider()
                }
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SettingsView()
}
