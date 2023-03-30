
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
    @EnvironmentObject
    var globalStore: GlobalStore
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
            ZStack{
                Image(globalStore.currentScene == EnumScene.sequence1 ? "Quiz_1" : "Quiz_2" )
                    .offset(y: globalStore.safeAreaSize.1 / 2)
                VStack (alignment: .leading){
                    Spacer()
                    QuestionView()
                        .padding(.horizontal, 24)
                        .offset(y: 16)
                    Spacer(minLength: 24)
                    AnswerView()
                        .padding(.horizontal, 24)
                    Spacer()
                    if globalStore.currentScene == EnumScene.sequence1 {
                        QuizButtonView1(isShowingModal: $isShowingModal, quizFalse: $quizFalse){
                        }
                    }
                    else {
                        QuizButtonView(isShowingModal: $isShowingModal, quizFalse: $quizFalse){
                        }
                    }
                }
            }
            .background(CustomColor.scriptBox)
            .presentationDetents([.medium, .large], selection: $settingsDetent)
        }
        .onAppear{
            setTimeoutClosure(timeCount: 100) {
                isShowingModal = true
            }
        }
    }
}
