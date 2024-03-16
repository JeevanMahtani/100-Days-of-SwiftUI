//
//  CardView.swift
//  FlashZilla
//
//  Created by Jeevan Mahtani on 12/3/24.
//

import SwiftUI

struct CustomFillModifier: ViewModifier {
    var offset: CGSize
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .fill(determineColour())
            )
    }
    
    private func determineColour() -> Color {
        if offset.width > 0 {
            return Color.green
        } else if offset.width < 0 {
            return Color.red
        } else {
            return Color.white
        }
    }
}

extension View {
    func fillCardBackground(from offset: CGSize) -> some View {
        self.modifier(CustomFillModifier(offset: offset))
    }
}

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    let card: Card
    var removal: ((_ isWrong: Bool) -> Void)? = nil
    
    @State private var offset = CGSize.zero
    @State private var isShowingAnswer = false
    @State private var backToZero = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor ? .white :
                    .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                )
                .background(
                    accessibilityDifferentiateWithoutColor ? nil :
                    RoundedRectangle(cornerRadius: 25)
                        .fillCardBackground(from: offset)
                    
                    )
                .shadow(radius: 10)
            
            VStack {
                if accessibilityVoiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    
                    if isShowingAnswer { 
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x: offset.width * 5)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture (
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        removal?(offset.width < 0)
                    } else {                       
                        offset = .zero
                    }
                }
        )
        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.default,value: offset)
    }
}

#Preview {
    CardView(card: .example)
}
