//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct AutoDoorView: View {    
    @Binding var animating = Bool
    
    var body: some View {
        VStack{
            ZStack {
                Image("Object_Door_Left")
                    .offset(x: animating ? -40 : 0)
                Image("Object_Door_Right")
                    .offset(x: animating ? 40 : 0)
                Image("Object_Door_Frame")
            }
            .animation(.easeInOut(duration: 3), value: animating)
            .mask(
                Rectangle()
                    .frame(width: 100, height: 65)
            )
            .onAppear {
                self.animating = true
            }
        }
    }
}
