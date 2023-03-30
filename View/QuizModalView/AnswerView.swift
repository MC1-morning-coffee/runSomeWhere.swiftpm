//
//  SwiftUIView.swift
//
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct AnswerView: View {
    // QuizData에 있는 question값을 가져와서 String으로 형 변환해준다
    var answer: String = QUESTION_TWO["answer"] as? String ?? ""
    
    var body: some View {
        CustomText(value: "\(answer)", fontSize: 18, color: Color.black)
            .border(.red)
    }
}

struct Answer_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView()
    }
}
