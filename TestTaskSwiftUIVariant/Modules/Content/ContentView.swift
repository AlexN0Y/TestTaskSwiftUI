//
//  ContentView.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 24.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            ForEach(TabItem.allCases) { tab in
                NavigationStack {
                    tab.view
                        .navigationBarTitle(tab.title, displayMode: .large)
                }
                .tabItem {
                    Label(tab.title, systemImage: tab.systemImage)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
