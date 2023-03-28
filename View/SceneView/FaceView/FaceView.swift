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
    
    private let structInfo = FACE_VIEW_INFO()

    var body: some View {
        Image("\(structInfo.srcRoot)_\(target)")
            .frame(width: structInfo.size.width, height: structInfo.size.height)
    }
}
