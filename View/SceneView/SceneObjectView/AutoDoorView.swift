//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct AutoDoorView: View {    
    @State private var isAnimating = Bool
    
    var body: some View {
        VStack{
            ZStack {
                Image("Object_Door_Left")
                /*.resizable()
                 .frame(width: 100, height: 65)*/
                    //.position(x: 195, y: 165)
                    .offset(x: isAnimating ? -40 : 0)
                Image("Object_Door_Right")
                /*.resizable()
                 .frame(width: 100, height: 65)*/
                    //.position(x: 195, y: 165)
                    .offset(x: isAnimating ? 40 : 0)
                Image("Object_Door_Frame")
                    //.position(x: 195, y: 165)
                /*.resizable()
                 .frame(width: 100, height: 65)*/
            }
            .animation(.easeInOut(duration: 3), value: isAnimating)
            .mask(
                Rectangle()
                    .frame(width: 100, height: 65)
                    //.position(x: 195, y: 165)
            )
            .onAppear {
                self.isAnimating = true
            }
        }
    }
}
