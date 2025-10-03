//  ReflectAnimationView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 28/09/25.
//

import SwiftUI

struct ReflectAnimationView: View {
    private var count: Int = 22
    private var width: CGFloat = 100
    private var height: CGFloat = 100
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
            .rotationEffect(.degrees(isAnimation ? 190 : 0))
            .scaleEffect(isAnimation ? 0.4 : 0.05)
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

extension ReflectAnimationView {
    @ViewBuilder
    var animationItem: some View {
        let gradientColor = LinearGradient(gradient:
                                            Gradient(colors: [Color.green.opacity(0.8),
                                                              Color.teal.opacity(0.6)]),
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing)
        TrinaguleView()
            .fill(gradientColor)
            .frame(width: width,
                   height: height,
                   alignment: .center)

    }
}

struct TrinaguleView: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height = rect.height
        
        path.move(to: CGPoint(x: rect.midX,
                              y: rect.minY))
        path.addQuadCurve(to: CGPoint(x: rect.minX,
                                      y: rect.maxY),
                          control: CGPoint(x: rect.minX,
                                           y: rect.minY + height * 0.5))
        path.addQuadCurve(to: CGPoint(x: rect.midX,
                                      y: rect.minY),
                          control: CGPoint(x: rect.maxX,
                                           y: rect.minY + height * 0.5))
        return path
    }
}

#Preview {
    ReflectAnimationView()
}
