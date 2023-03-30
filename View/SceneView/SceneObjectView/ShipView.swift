//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct ShipView: View {
    @State private var isShaking = false
    var body: some View {
        Image("Object_Boat")
            .fixedSize()
            .position(x: 195, y: 300)
            .offset(y: (isShaking ? 10 : -10))
            .animation(Animation.easeInOut(duration: 0.8) .repeatForever(autoreverses: true))
            .onAppear() {
                isShaking = true
            }
    }
}

struct ShipView_Previews: PreviewProvider {
    static var previews: some View {
        ShipView()
    }
}
