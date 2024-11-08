//
//  TimerView.swift
//  TestTaskSwiftUIVariant
//
//  Created by Alex Gav on 24.10.2024.
//

import SwiftUI

struct TimerView: View {
    
    @StateObject private var viewModel = TimerViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            timerLabel
            playPauseButton
            
            Spacer()
        }
        .padding()
        .task { viewModel.animateButton = true }
    }
}

private extension TimerView {
    
    var timerLabel: some View {
        Text(viewModel.timeString())
            .font(.largeTitle)
            .scaleEffect(viewModel.animateTimer ? 1.1 : 1.0)
            .animation(
                viewModel.animateTimer
                ? Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
                : .default,
                value: viewModel.animateTimer
            )
            .padding(.top, 20)
    }
    
    var playPauseButton: some View {
        Button(action: { viewModel.didTapPlayPauseButton() }) {
            VStack(spacing: 20) {
                ZStack {
                    Circle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.blue)
                    
                    Image(systemName: viewModel.isRunning ? "pause.fill" : "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 40))
                }
                .scaleEffect(viewModel.animateButton ? 1.15 : 1.0)
                .animation(
                    viewModel.animateButton
                    ? Animation.easeInOut(duration: 1).repeatForever(autoreverses: true)
                    : .default,
                    value: viewModel.animateButton
                )
                
                Text(viewModel.isRunning ? "Pause" : "Play")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
        }
    }
}

#Preview {
    TimerView()
}
