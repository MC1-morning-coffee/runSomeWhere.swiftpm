
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
@available(iOS 16.0, *)
struct QuizModalView: View {
    var width = CGFloat(390)
    
    @State var isShowingModal: Bool = false
    // 모달 뷰를 중간까지만 띄우는 방법은 iOS16부터만 지원 가능..
    @State var quizFalse: Bool = false
    
    @State private var settingsDetent = PresentationDetent.medium
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        Button {
            isShowingModal = true
        } label: {
            Text("")
                .frame(width: width, height: SCRIPT_BOX_HEIGHT)
                .background(.opacity(0))
        }.sheet(isPresented: $isShowingModal) {
            //Text("modal view")
            VStack (alignment: .leading){
                Spacer()
                QuestionView().padding()
                Spacer()
                AnswerView().padding()
                Spacer()
                QuizButtonView(isShowingModal: $isShowingModal, quizFalse: $quizFalse){
                }
            }
            .presentationDetents([.medium, .large], selection: $settingsDetent)
        }
    }
}
