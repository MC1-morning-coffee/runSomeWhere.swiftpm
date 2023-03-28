//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/28.
//

import SwiftUI

struct FaceView: View {

    var direction = "left"
    var target = EnumSpeaker.coffee
    
    private let VIEW_SIZE = CGSize(width: 150, height: 200)

    private let IMAGE_PATH = "Face"
    

    var body: some View {
        Image("\(IMAGE_PATH)_\(target)")
            .frame(width: VIEW_SIZE.width, height: VIEW_SIZE.height)
            .background(Color.green)
    }
}
