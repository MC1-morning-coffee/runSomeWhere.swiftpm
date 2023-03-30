//
//  SwiftUIView.swift
//
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct QuizButtonView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var isShowingModal: Bool
    @Binding var quizFalse: Bool

    var completion: ()->()
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            Button{
                quizFalse.toggle()
            } label: {
                CustomText(value: "A", fontSize: 18, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
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
                CustomText(value: "B", fontSize: 18, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
            }.alert(isPresented: $quizFalse) {
                Alert(title: Text("틀렸습니다!"),
                      message: Text(""),
                      dismissButton: .default(Text("다시 풀어보기")))
            }
            .cornerRadius(15)
            Button {
                isShowingModal = false
                
            } label: {
                CustomText(value: "C", fontSize: 18, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
            }
            .cornerRadius(15)
            Button {
                quizFalse.toggle()
            } label: {
                CustomText(value: "D", fontSize: 18, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
            }.alert(isPresented: $quizFalse) {
                Alert(title: Text("틀렸습니다!"),
                      message: Text(""),
                      dismissButton: .default(Text("다시 풀어보기")))
            }
            .cornerRadius(15)
           
        }
    }
}

//struct QuizButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizButtonView()
//    }
//}
