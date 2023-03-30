//
//  SwiftUIView.swift
//
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct AnswerView: View {
    @EnvironmentObject
    var globalStore: GlobalStore
    // QuizData에 있는 question값을 가져와서 String으로 형 변환해준다
    
//    @Binding var isStart: Bool
    let answer: String = QUESTION_TWO["answer"] as? String ?? ""
    let answer1: String = QUESTION_TWO["answer1"] as? String ?? ""
    
    var body: some View {
        if globalStore.currentScene == EnumScene.sequence1 {
            CustomText(value: "\(answer)", fontSize: 18, color: Color.black)
                .border(.red)
        }
        else {
            CustomText(value: "\(answer1)", fontSize: 18, color: Color.black)
                .border(.red)
        }
    }
}
