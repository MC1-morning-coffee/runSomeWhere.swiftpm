//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct JolJolView: View {
    var start: (Float, Float) // 시작 위치
    var end: (Float, Float) // 끝 위치
    
    @State var imageOffset: Bool = false
    
    var body: some View {
        //Image("Object_WaterPurifier")
        
        VStack {
            Image("Object_WaterPurifier")
                .position(x: CGFloat(start.0), y: CGFloat(start.1))
                .edgesIgnoringSafeArea(.all)
                .offset(x:  (imageOffset ? CGFloat(end.0) : 0), y: imageOffset ? CGFloat(end.1) : 0)
                .onAppear{
                    withAnimation(.linear(duration: 1.0)){
                        self.imageOffset.toggle()
                    }
                }
        }
    }
}
