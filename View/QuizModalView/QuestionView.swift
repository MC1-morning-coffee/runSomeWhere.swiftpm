//
//  SwiftUIView.swift
//  
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct QuestionView: View {
    let q: String = QUESTION_TWO["question"] as? String ?? ""
    var body: some View {
        CustomText(value: "내 열쇠와 색이 같은 문을 열고 들어가보자.")
        //Text(QUESTION_TWO["question"] as? String ?? "")
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
