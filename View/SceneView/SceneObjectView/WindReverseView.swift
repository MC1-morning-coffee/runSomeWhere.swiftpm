//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct WindReverseView: View {
    
    let windImages = ["Object_Wind_4", "Object_Wind_3", "Object_Wind_2", "BObject_Wind_1"]
    
    @State private var currentImageIndex = 0
    
    var body: some View {
        Image(windImages[currentImageIndex])
            .ignoresSafeArea(.all)
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){ _ in
                    currentImageIndex = (currentImageIndex + 1) % windImages.count
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                       timer.invalidate()
                   }
            }
    }
}
        
        struct WindReverseView_Previews: PreviewProvider {
            static var previews: some View {
                WindReverseView()
            }
        }
        
