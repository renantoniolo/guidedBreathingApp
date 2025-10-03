//
//  MindStartView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 15/09/25.
//

import SwiftUI
import WatchKit

struct MindStartView: View {
    @State var selection: Int = 1
    @Environment(\.dismiss) var dismiss
    @ObservedObject var model: MenuData
    
    var body: some View {

        ZStack {
            self.bg
            TabView(selection: $selection) {
                buttonEnd
                
                animations
                    .tag(1)
                
                MindTimerView(minutos: model.timerInt,
                              onComplete: { dismiss() })
                .tag(3)
                
                NowPlayingView()
                    .tag(2)
            }
            .tabViewStyle(.verticalPage)
            .navigationBarBackButtonHidden()
        }
    }
}

// MARK: - ViewBuilders
extension MindStartView {
    @ViewBuilder
    var buttonEnd: some View {
        Button("Finalizar") {
            dismiss()
        }
        .padding()
        .buttonStyle(.glass)
        .foregroundColor(Color.red.opacity(0.4))
        .tag(0)
    }
    
    @ViewBuilder
    var animations: some View {
        switch model.section {
        case .spirit:
            SpiritAnimationView()
        case .breaht:
            BreahtAnimationView()
        case .reflect:
            ReflectAnimationView()
        }
    }
    
    @ViewBuilder
    var bg: some View {
        LinearGradient(colors: [
            .black,
            .black,
            .gray.opacity(0.2)],
                       startPoint: .top,
                       endPoint: .bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    MindStartView(model: MenuData(section: .breaht))
}
