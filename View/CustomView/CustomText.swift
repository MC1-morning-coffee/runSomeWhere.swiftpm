
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct CustomText: View {
    var value = ""
    var fontSize = 32
    var color = Color.white
    
    var body: some View {
        Text(value)
            .font(Font.custom("morris9", size: CGFloat(fontSize)))
            .lineSpacing(8)
            .foregroundColor(color)
    }
}
