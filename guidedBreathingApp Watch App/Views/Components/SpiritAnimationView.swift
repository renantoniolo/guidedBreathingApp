//
//  SpiritAnimationView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 28/09/25.
//

import SwiftUI

struct SpiritAnimationView: View {
    private var count: Int = 22
    private var width: CGFloat = 120
    private var height: CGFloat = 120
    @State var isAnimation: Bool = false
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<count, id: \.self) { index in
                    let angle = Double(index) * (360.0 / Double(self.count))
                    
                    animationItem
                        .offset(y: isAnimation ? -100 : -50)
                        .rotationEffect(.degrees(angle))
                        .blur(radius: isAnimation ? 0 : 16)
                }
            }
            .scaleEffect(isAnimation ? 0.4 : 0.05)
            .rotationEffect(.degrees(isAnimation ? 180 : 0))
            .onAppear {
                withAnimation(Animation.easeOut(duration: 4).repeatForever(autoreverses: true)) {
                    self.isAnimation = true
                }
            }
            TextAnimationView(isAnimating: $isAnimation)
                .padding(.top, 22)
        }
    }
}

// MARK: - Circle

extension SpiritAnimationView {
    @ViewBuilder
    var animationItem: some View {
        let gradientColor = LinearGradient(gradient:
                                            Gradient(colors: [Color.cyan.opacity(0.5),
                                                              Color.purple.opacity(0.3)]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
        RoundedRectangle(cornerRadius: 12)
            .fill(gradientColor)
            .frame(width: width,
                   height: height,
                   alignment: .center)

    }
}

#Preview {
    SpiritAnimationView()
}
