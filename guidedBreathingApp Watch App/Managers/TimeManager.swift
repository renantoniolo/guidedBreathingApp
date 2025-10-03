//
//  TimeManager.swift
//  guidedBreathingApp
//
//  Created by Renan Toniolo Rocha on 29/09/25.
//

import Foundation
import SwiftUI
import Combine

final class TimeManager: ObservableObject {
    @Published var timeRemaining: Int = 0
    @Published var isRunning: Bool = false
    
    private var totalSeconds: Int = 0
    private var onComplete: (() -> Void) = {}
    
    private var cancellable: AnyCancellable?
    
    var progress: Double {
        guard totalSeconds > 0 else { return 0 }
        return 1 - Double(timeRemaining) / Double(totalSeconds)
    }
    
    var timer: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    init(minutos: Int, onComplete: @escaping () -> Void) {
        self.timeRemaining = minutos * 60
        self.totalSeconds = minutos * 60
        self.onComplete = onComplete
        self.isRunning = false
        self.cancellable = nil
        self.startTimer()
    }
    
    private func startTimer() {
        self.cancellable = Timer.publish(every: 1.0,
                                         on: .main,
                                         in: .common)
        .autoconnect()
        .sink{ [weak self] _ in
            guard let self = self, self.isRunning else {
                return
            }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.isRunning = false
                self.cancellable?.cancel()
                self.onComplete()
            }
        }
            
    }
}
