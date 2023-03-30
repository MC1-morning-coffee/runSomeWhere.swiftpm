//
//  SwiftUIView.swift
//
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct QuizButtonView: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @Environment(\.presentationMode) var presentation
    @Binding var isShowingModal: Bool
    @Binding var quizFalse: Bool

    var completion: ()->()
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            Button{
                isShowingModal = false
                handleSequenceQuizOne(globalStore: globalStore)
            } label: {
                CustomText(value: "O", fontSize: 32, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(Color.clear)
                    .background(Color.clear)
            }.alert(isPresented: $quizFalse) {
                Alert(title: Text("틀렸습니다!"),
                      message: Text(""),
                      dismissButton: .default(Text("다시 풀어보기")))
            }
            .cornerRadius(15)
            Button {
                //print("hello")
                //completion()
                quizFalse.toggle()
            } label: {
                CustomText(value: "X", fontSize: 32, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(Color.clear)
            }.alert(isPresented: $quizFalse) {
                Alert(title: Text("틀렸습니다!"),
                      message: Text(""),
                      dismissButton: .default(Text("다시 풀어보기")))
            }
            .cornerRadius(15)
        }
        .offset(y: -32)
        .padding(.horizontal, 24)
    }
}

//struct QuizButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizButtonView()
//    }
//}
