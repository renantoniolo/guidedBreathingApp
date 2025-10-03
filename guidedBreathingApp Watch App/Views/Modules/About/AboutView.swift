//
//  AboutView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 15/09/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 8.0) {
                Text("Respiração Guiada")
                    .bold()
                Text("Este app foi criado para ajudar você a praticar técnicas de respiração guiada, promovendo relaxamento e bem-estar.")
                    .padding(.bottom, 22)
            }
        }
    }
}

#Preview {
    AboutView()
}
