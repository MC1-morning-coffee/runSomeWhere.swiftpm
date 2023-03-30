//
//  SwiftUIView.swift
//
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject
    var globalStore: GlobalStore
    
//    @Binding var isStart: Bool

    let q = QUESTION_TWO["question"] as? String ?? ""
    let q1 = QUESTION_TWO["question1"] as? String ?? ""

    // QuizData에 있는 question값을 가져와서 String으로 형 변환해준다
    
    var body: some View {
        if globalStore.currentScene == EnumScene.sequence1 {
            CustomText(value: "\(q)", fontSize: 23, color: Color.black)
                .border(.red)
        }
        else {
            CustomText(value: "\(q1)", fontSize: 23, color: Color.black)
                .border(.red)
        }
        // Text(QUESTION_TWO["question"] as? String ?? "") .border(.red)
    }
}
