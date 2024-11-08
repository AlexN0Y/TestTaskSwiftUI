//
//  AppearAnimationModifier.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 28.10.2024.
//

import SwiftUI

struct AppearAnimationModifier: ViewModifier {
    
    @State private var hasAppeared = false

    func body(content: Content) -> some View {
        content
            .opacity(hasAppeared ? 1 : 0)
            .animation(.easeInOut(duration: 0.75), value: hasAppeared)
            .onAppear {
                hasAppeared = true
            }
    }
}

extension View {
    
    func animatedAppear() -> some View {
        modifier(AppearAnimationModifier())
    }
}
