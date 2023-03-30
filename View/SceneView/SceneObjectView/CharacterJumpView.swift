//
//  File.swift
//
//
//  Created by 최민규 on 2023/03/31.
//

import SwiftUI

struct CharacterJumpView: View {
    
    @State private var isPeopleJumping = false
    var body: some View {
        ZStack {
           Image("Walker_Front")
                .position(x: 50, y: 400)
                .offset(x: 0, y: (isPeopleJumping ? 10 : 0))
                .animation(Animation.linear(duration: 0.15)
                    .delay(0.1)
                    .repeatCount(5, autoreverses: true))
                .onAppear() {
                    isPeopleJumping = true
                }
            Image("Luna_Front")
                 .position(x: 90, y: 460)
                 .offset(x: 0, y: (isPeopleJumping ? 10 : 0))
                 .animation(Animation.linear(duration: 0.2)
                     .repeatCount(3, autoreverses: true))
                 .onAppear() {
                     isPeopleJumping = true
                 }
            Image("Coffee_Front")
                 .position(x: 150, y: 490)
                 .offset(x: 0, y: (isPeopleJumping ? 10 : 0))
                 .animation(Animation.linear(duration: 0.15)
                    .delay(0.2)
                     .repeatCount(5, autoreverses: true))
                 .onAppear() {
                     isPeopleJumping = true
                 }
            Image("Muho_Front")
                 .position(x: 210, y: 495)
                 .offset(x: 0, y: (isPeopleJumping ? 10 : 0))
                 .animation(Animation.linear(duration: 0.2)
                    .delay(0.1)
                     .repeatCount(7, autoreverses: true))
                 .onAppear() {
                     isPeopleJumping = true
                 }
            Image("Olive_Front")
                 .position(x: 280, y: 450)
                 .offset(x: 0, y: (isPeopleJumping ? 10 : 0))
                 .animation(Animation.linear(duration: 0.15)
                    .delay(0.3)
                     .repeatCount(5, autoreverses: true))
                 .onAppear() {
                     isPeopleJumping = true
                 }
            Image("Henry_Front")
                 .position(x: 340, y: 410)
                 .offset(x: 0, y: (isPeopleJumping ? 10 : 0))
                 .animation(Animation.linear(duration: 0.2)
                     .repeatCount(5, autoreverses: true))
                 .onAppear() {
                     isPeopleJumping = true
                 }
        }
    }
}

struct CharacterJumpView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterJumpView()
    }
}
