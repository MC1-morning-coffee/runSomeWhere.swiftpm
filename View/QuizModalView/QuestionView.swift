//
//  SwiftUIView.swift
//  
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct QuestionView: View {
    // QuizData에 있는 question값을 가져와서 String으로 형 변환해준다
    let q: String = QUESTION_TWO["question"] as? String ?? ""
    
    var body: some View {        
        CustomText(value: "\(q)", fontSize: 23, color: Color.black)
            .border(.red)
        // Text(QUESTION_TWO["question"] as? String ?? "") .border(.red)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
