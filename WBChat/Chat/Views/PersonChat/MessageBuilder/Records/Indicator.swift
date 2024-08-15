//
//  Indicator.swift
//  WBChat
//
//  Created by Vladimir on 08.08.2024.
//
import SwiftUI

struct Indicator: View {

    let count = 2

    var body: some View {
        let animation = Animation
            .linear(duration: 1)
            .repeatForever(autoreverses: false)

        ForEach(0..<count, id: \.self) { index in
            GrowingCircleIView(animation: animation.delay(CGFloat(index) * 0.5))
        }
    }
}

struct GrowingCircleIView: View {

    let animation: Animation

    @State private var scale: CGFloat = 0.6
    @State private var opacity: Double = 1

    var body: some View {

        return Circle()
            .scaleEffect(scale)
            .opacity(opacity)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    withAnimation(animation) {
                        scale = 1
                        opacity = 0
                    }
                }
            }
    }
}
