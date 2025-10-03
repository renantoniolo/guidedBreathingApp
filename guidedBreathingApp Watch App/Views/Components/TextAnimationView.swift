//
//  TextAnimationView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 29/09/25.
//

import SwiftUI

struct TextAnimationView: View {
    
    @Binding var isAnimating: Bool
    var body: some View {
        Text(isAnimating ? "Inspire" : "Expire")
            .font(.system(size: 14, weight: .regular, design: .rounded))
            
    }
}

#Preview {
    TextAnimationView(isAnimating: .constant(true))
}
