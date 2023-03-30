//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct SequenceBlinkView: View {
    
    let introImages = ["Background_Blink_1", "Background_Blink_2"]
    
    @State private var currentImageIndex = 0
    
    var body: some View {
        Image(introImages[currentImageIndex])
            .ignoresSafeArea(.all)
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true){ _ in
                    currentImageIndex = (currentImageIndex + 1) % introImages.count
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    timer.invalidate()
                }
            }
    }
}

