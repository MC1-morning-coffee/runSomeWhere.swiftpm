
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
    
    @State
    var tmpText: String = ""
//    @Binding var isStart: Bool
    
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            tmpText = ""
        }
        if position < value.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                tmpText.append(value[position])
                typeWriter(at: position + 1)
            }
        }
    }
    
    var body: some View {
        Text(tmpText)
            .font(Font.custom("morris9", size: CGFloat(fontSize)))
            .lineSpacing(8)
            .foregroundColor(color)
            .onReceive(globalStore.$scriptCount, perform: {
                currentCount in
                print("나는 지금 불렸어")
                typeWriter()
            })

//        TypeWriterTextView(
//                       value,
//                       speed: 0.1,
//                       isStart: $isStart
//                   ).font(Font.custom("morris9", size: CGFloat(fontSize))).lineSpacing(8).foregroundColor(color)

    }

}

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
