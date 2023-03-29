//
//  SwiftUIView.swift
//  
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct AnswerView: View {
    var body: some View {
        Text(QUESTION_TWO["answer"] as? String ?? "")
            .border(Color.red, width: 1)
    }
}

struct Answer_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView()
    }
}
