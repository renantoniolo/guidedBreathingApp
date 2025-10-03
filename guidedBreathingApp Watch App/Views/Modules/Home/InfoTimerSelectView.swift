//
//  InfoTimerSelectView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 18/09/25.
//

import SwiftUI

struct InfoTimerSelectView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var model: MenuData
    
    let timers = [1, 3, 5, 10, 15, 20, 25, 30]
    
    var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 8.0) {
                ForEach(timers, id: \.self) { timer in
                    Button("\(timer) Minuto") {
                        model.setTime(timer: timer)
                        model.timerInt = timer
                        dismiss()
                    }
                    .buttonStyle(.glass)
                }
            }
        }
    }
}

#Preview {
    InfoTimerSelectView(model: MenuData(section: .breaht))
}
