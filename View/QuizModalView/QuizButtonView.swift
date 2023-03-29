//
//  SwiftUIView.swift
//  
//
//  Created by Bokyung on 2023/03/29.
//

import SwiftUI

struct QuizButtonView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            Button {
                
            } label: {
                Text("A")
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
            }
            .cornerRadius(15)
            Button {
                
            } label: {
                Text("B")
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
            }
            .cornerRadius(15)
            Button {
                
            } label: {
                Text("C")
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
            }
            .cornerRadius(15)
            Button {
                
            } label: {
                Text("D")
                    .frame(width: 180, height: 70)
                    .foregroundColor(.white)
                    .background(.gray)
            }
            .cornerRadius(15)
           
        }
    }
}

struct QuizButtonView_Previews: PreviewProvider {
    static var previews: some View {
        QuizButtonView()
    }
}
