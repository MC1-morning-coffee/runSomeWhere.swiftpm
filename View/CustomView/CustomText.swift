
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct CustomText: View {

    @EnvironmentObject
    var globalStore: GlobalStore
    
    var value = ""

    
    var fontSize = 32
    var color = CustomColor.scriptColor
        
    var body: some View {
        Text(value)
            .font(Font.custom("morris9", size: CGFloat(fontSize)))
            .lineSpacing(8)
            .foregroundColor(color)
    }

}
