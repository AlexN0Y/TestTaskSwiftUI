//
//  TimerViewModel.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 27.10.2024.
//

import SwiftUI

final class TimerViewModel: ObservableObject {
    
    @Published var animateButton = false
    @Published var animateTimer = false
    
    @Published private(set) var isRunning = false
    
    @Published private var timeElapsed: TimeInterval = 0
    @Published private var timer: Timer?
}

extension TimerViewModel {
    
    func timeString() -> String {
        let hours = Int(timeElapsed) / 3600
        let minutes = Int(timeElapsed) / 60 % 60
        let seconds = Int(timeElapsed) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    @MainActor
    func didTapPlayPauseButton() {
        Task {
            isRunning.toggle()
            
            try? await Task.sleep(nanoseconds: 100000000)
            
            if isRunning {
                startTimer()
                animateButton = false
                animateTimer = true
            } else {
                resetTimer()
                animateButton = true
                animateTimer = false
            }
        }
    }
}

private extension TimerViewModel {
    
    func startTimer() {
        timer?.invalidate()
        let startDate = Date() - timeElapsed
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timeElapsed = Date().timeIntervalSince(startDate)
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timeElapsed = 0
    }
}
