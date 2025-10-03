//
//  HomeView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 15/09/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var breaht = MenuData(section: .breaht)
    @StateObject var reflect = MenuData(section: .reflect)
    @StateObject var spirit = MenuData(section: .spirit)
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [
                    .black,
                    .blue.opacity(0.2)],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .ignoresSafeArea()
                
                TabView {
                    MenuItemView(model: breaht)
                    MenuItemView(model: reflect)
                    MenuItemView(model: spirit)
                    VStack(spacing: 8.0) {
                        NavigationLink("Configurações",
                                       destination: SettingsView())
                        .buttonStyle(.glass)
                        NavigationLink("Sobre",
                                       destination: AboutView())
                        .buttonStyle(.glass)
                    }
                    .padding()
                }
                .tabViewStyle(.verticalPage)
            }
        }
    }
}

#Preview {
    HomeView()
}
