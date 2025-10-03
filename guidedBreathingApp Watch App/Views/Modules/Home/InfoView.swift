//
//  InfoView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 18/09/25.
//

import SwiftUI

struct InfoView: View {
    
    @ObservedObject var model: MenuData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8.0) {
                    NavigationLink(model.timerStr,
                                   destination: InfoTimerSelectView(model: model))
                        .buttonStyle(.glass)
                    
                    Text(model.description)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(model.title)
        }
    }
}

#Preview {
    InfoView(model: MenuData(section: .breaht))
}
