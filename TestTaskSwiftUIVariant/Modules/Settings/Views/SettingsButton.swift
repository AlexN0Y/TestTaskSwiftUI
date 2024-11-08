//
//  SettingsButton.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 27.10.2024.
//

import SwiftUI

struct SettingsButton: View {
    
    let title: String
    let systemImageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: systemImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.cyan)
                
                Text(title)
                    .font(.system(size: 18))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(.gray.opacity(0.05))
            .cornerRadius(10)
        }
    }
}

#Preview {
    SettingsButton(
        title: "Hello",
        systemImageName: "globe",
        action: {}
    )
}
