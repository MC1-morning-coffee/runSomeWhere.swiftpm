//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct CharacterView: View {
     //move%2 ==0 이면 움직이도록 함 -> 나중에 scenNumber에 따라서 바뀌도록 수정해야 함
    @State var move: Int = 0
    
    var body: some View {
        // User.direction의 방향에 따라 바뀜
        let objectImage: String = {
            switch luna.direction {
            case .left:
                return "\(luna.name)left"
            case .right:
                return "\(luna.name)right"
            case .front:
                return "\(luna.name)front"
            case .back:
                return "\(luna.name)back"
            }
        }()
        
        // Luna의 Image
        VStack{
            Image(objectImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .border(.red)
                .offset(y: {
                    if move%2 == 0 { // move변수가 짝수이면
                        return -50
                    } else {
                        return -400
                    }
                }()) //move가 true이면 위쪽으로 이동하기
                .animation(.easeOut(duration: 2), value: move)
                .onAppear{
                    print(luna.name)
                }
            
            Button {
                move += 1
            } label: {
                Text("move the character!")
                    .foregroundColor(.black)
            }
        }
    }
}
