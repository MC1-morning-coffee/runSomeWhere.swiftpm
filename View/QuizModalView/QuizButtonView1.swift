//
//  SwiftUIView.swift
//
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct QuizButtonView1: View {
    
    @EnvironmentObject
    var globalStore: GlobalStore
    
    @Environment(\.presentationMode) var presentation
    @Binding var isShowingModal: Bool
    @Binding var quizFalse: Bool

    var completion: ()->()
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            Button{
                quizFalse.toggle()
            } label: {
                CustomText(value: "A", fontSize: 32, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(Color.clear)
            }.alert(isPresented: $quizFalse) {
                Alert(title: Text("틀렸습니다!"),
                      message: Text(""),
                      dismissButton: .default(Text("다시 풀어보기")))
            }
            .cornerRadius(15)
            Button {
                quizFalse.toggle()
            } label: {
                CustomText(value: "B", fontSize: 32, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(Color.clear)
            }
            .cornerRadius(15)
            Button {
                isShowingModal = false
                handleSequenceQuizOne(globalStore: globalStore)
            } label: {
                CustomText(value: "C", fontSize: 32, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(Color.clear)
            }
            .cornerRadius(15)
            Button {
                quizFalse.toggle()
            } label: {
                CustomText(value: "D", fontSize: 32, color: Color.black)
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
        .offset(y: -24)
        .padding(.horizontal, 24)
    }
}

//struct QuizButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizButtonView()
//    }
//}
