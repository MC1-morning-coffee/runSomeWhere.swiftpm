//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct SequenceIntroView: View {
    
    let introImages = ["Background_Intro_1", "Background_Intro_2", "Background_Intro_3", "Background_Intro_4"]
    
    @State private var currentImageIndex = 0
    
    var body: some View {
        Image(introImages[currentImageIndex])
            .ignoresSafeArea(.all)
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true){ _ in
                    currentImageIndex = (currentImageIndex + 1) % introImages.count
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                       timer.invalidate()
                   }
            }
    }
}
        
        struct SequenceIntroView_Previews: PreviewProvider {
            static var previews: some View {
                SequenceIntroView()
            }
        }
        
