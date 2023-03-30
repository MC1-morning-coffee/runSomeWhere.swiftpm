//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct ShipPeopleView: View {
    @State private var isShaking = false
    var body: some View {
        ZStack {
            Image("Object_Boat")
                .fixedSize()
                .position(x: 195, y: 300)
                .offset(y: (isShaking ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.8) .repeatForever(autoreverses: true))
                .onAppear() {
                    isShaking = true
                }
            Image("Walker_Back_2")
                .fixedSize()
                .position(x: 150, y: 310)
                .offset(y: (isShaking ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.8) .repeatForever(autoreverses: true))
                .onAppear() {
                    isShaking = true
                }
            Image("Luna_Back_2")
                .fixedSize()
                .position(x: 160, y: 320)
                .offset(y: (isShaking ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.8) .repeatForever(autoreverses: true))
                .onAppear() {
                    isShaking = true
                }
            Image("Coffee_Back_2")
                .fixedSize()
                .position(x: 180, y: 330)
                .offset(y: (isShaking ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.8) .repeatForever(autoreverses: true))
                .onAppear() {
                    isShaking = true
                }
            Image("Muho_Back_2")
                .fixedSize()
                .position(x: 190, y: 320)
                .offset(y: (isShaking ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.8) .repeatForever(autoreverses: true))
                .onAppear() {
                    isShaking = true
                }
            Image("Olive_Back_2")
                .fixedSize()
                .position(x: 210, y: 330)
                .offset(y: (isShaking ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.8) .repeatForever(autoreverses: true))
                .onAppear() {
                    isShaking = true
                }
            Image("Henry_Back_2")
                .fixedSize()
                .position(x: 230, y: 340)
                .offset(y: (isShaking ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.8) .repeatForever(autoreverses: true))
                .onAppear() {
                    isShaking = true
                }
        }
        
    }
}

struct ShipPeopleView_Previews: PreviewProvider {
    static var previews: some View {
        ShipPeopleView()
    }
}
