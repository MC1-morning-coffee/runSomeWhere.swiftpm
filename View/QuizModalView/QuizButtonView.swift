//
//  SwiftUIView.swift
//
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct QuizButtonView: View {
    @Environment(\.presentationMode) var presentation
    
    var completion: ()->()
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            Button{
            } label: {
                CustomText(value: "A", fontSize: 18, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
            }
            .cornerRadius(15)
            Button {
                print("hello")
                completion()
            } label: {
                CustomText(value: "B", fontSize: 18, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
            }
            .cornerRadius(15)
            Button {
                
            } label: {
                CustomText(value: "C", fontSize: 18, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
            }
            .cornerRadius(15)
            Button {
                
            } label: {
                CustomText(value: "D", fontSize: 18, color: Color.black)
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
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
