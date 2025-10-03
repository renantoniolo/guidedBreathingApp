//
//  MindTimerView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 29/09/25.
//

import SwiftUI

struct MindTimerView: View {
    
    @StateObject private var timer: TimeManager
    
    init(minutos: Int,
         onComplete: @escaping () -> Void) {
        _timer = StateObject(wrappedValue: TimeManager(minutos: minutos,
                                                       onComplete: onComplete))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            circleView
            buttonPlay
        }
    }
}

// Components

extension MindTimerView {
    @ViewBuilder
    var buttonPlay: some View {
        Button(action:didTapPlay) {
            Image(systemName: timer.isRunning ? "pause.fill" : "play.fill")
                .frame(width: 33, height: 33)
                .glassEffect()
        }
        .buttonStyle(.plain)
    }
    
    @ViewBuilder
    var circleView: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .opacity(0.2)
            
            Circle()
                .trim(from: 0.0, to: timer.progress)
                .stroke(style: StrokeStyle(lineWidth: 10,
                                             lineCap: .round))
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: -90))
                .animation(.linear, value: timer.progress)
            
            Text("\(timer.timer)")
                .font(.title3)
                .bold()
                .frame(width: 100)
        }
    }
}

// MARK: - Actions

extension MindTimerView {
    private func didTapPlay() {
        self.timer.isRunning.toggle()
    }
}

#Preview {
    MindTimerView(minutos: 1,
                  onComplete: {})
}
