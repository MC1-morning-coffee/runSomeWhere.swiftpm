//
//  File.swift
//  
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

/**
 1. `쫄쫄이`, `동문이`와 상호작용 시 열린다.
 2. `Picker` or `Button`을 사용하여 정답을 선택할 수 있다.
 3. 정답 클릭 시 닫힌다.
 */
struct QuizModalView: View {
    @State var isShowingModal: Bool = false
    
    var body: some View {
        Text("Quiz Modal View")
        Button {
            isShowingModal = true
        } label: {
            Text("문제풀기")
                .foregroundColor(.black)
                .background(.white)
        }.sheet(isPresented: $isShowingModal) { // 바인딩 변수 $isShowingModal
            ZStack {
                Color.orange.ignoresSafeArea()
                Text("Modal View")
            }
        }
    }
}
