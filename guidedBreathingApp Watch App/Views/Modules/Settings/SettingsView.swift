//
//  SettingsView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 15/09/25.
//

import SwiftUI

struct SettingsView: View {
    
    var version: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0.0"
    
    var body: some View {
        VStack(alignment: .center,
               spacing: 8.0) {
            
            Text("Feito por")
            Text("Renan Toniolo Rocha")
            Text("Versão - \(version)")
                .padding(.bottom, 16)
        }
    }
}

#Preview {
    SettingsView()
}
