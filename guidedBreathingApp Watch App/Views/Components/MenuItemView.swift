//
//  MenuItemView.swift
//  guidedBreathingApp Watch App
//
//  Created by Renan Toniolo Rocha on 16/09/25.
//

import SwiftUI

struct MenuItemView: View {
    
    @ObservedObject var model: MenuData
    @State var isInfo: Bool = false
    
    var body: some View {
        HStack {
            leftView
            Spacer()
            rightView
        }
        .padding()
        .fullScreenCover(isPresented: $isInfo, content: {
            InfoView(model: model)
        })
    }
}

// MARK - Views

extension MenuItemView {
    @ViewBuilder
    var leftView: some View {
        NavigationLink(destination: MindStartView(model: model)) {
            VStack(alignment: .leading, spacing: 8.0) {
                Image(systemName: model.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)
                    .foregroundColor(.blue.opacity(0.4))
                    .accessibilityLabel("icone \(model.title)")
                
                Text(model.title)
                    .bold()
                    .accessibilityLabel("titulo \(model.title)")
                
                Text(model.timerStr)
                    .font(.footnote)
                    .foregroundColor(.blue.opacity(0.5))
                    .bold()
                    .accessibilityLabel("timer \(model.timerStr)")
            }
        }
        .buttonStyle(.plain)
        .padding()
    }
    
    @ViewBuilder
    var rightView: some View {
        VStack(alignment: .center) {
            Button(action: buttonAction) {
                Image(systemName: "ellipsis.circle.fill")
                    .foregroundColor(.blue.opacity(0.5))
            }
            .buttonStyle(.plain)
            .accessibilityLabel("botão de opções")
            Spacer()
        }
    }
}

// MARK - Actions

extension MenuItemView {
    private func buttonAction() {
        isInfo = true
    }
}

// MARK - Preview

#Preview {
    MenuItemView(model: MenuData(section: .spirit))
}
