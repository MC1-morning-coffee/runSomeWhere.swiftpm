//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

/**
 1. 토글 이벤트로 켰다 껏다 할 수 있다.
 2. 값을 받아서 다른 이미지를 보여준다.
 */
struct DetailPopupView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    var target: EnumDetailImage = .Pouch
    
    private let IMAGE_PATH = "Image"
    private let IMAGE_SIZE: CGFloat = 290
    
    var body: some View {
        Image("\(IMAGE_PATH)_\(globalStore.currentDetailImage)")
            .frame(width: IMAGE_SIZE, height: IMAGE_SIZE)
    }
}

