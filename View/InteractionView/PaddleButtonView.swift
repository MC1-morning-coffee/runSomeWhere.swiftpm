//
//  SwiftUIView.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

/**
 1. 사용자로부터 클릭 이벤트를 받아서 배 오브젝트를 이동시킨다.
 */
struct PaddleButtonView: View {
    @State private var isOffsetActive = false
    
    var body: some View {
        Image("Object_No")
            .fixedSize()
            .position(x: 195, y: 550)
            .offset(y: (isOffsetActive ? 10 : 0))
            .onTapGesture {
                isOffsetActive = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
                    isOffsetActive = false
                }
            }
        }
    }

struct PaddleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PaddleButtonView()
    }
}
