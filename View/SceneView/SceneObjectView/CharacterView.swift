//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

struct CharacterView: View {
    var objectName: String // 오브젝트의 이름
    var makeDirection: EnumDirection // 오브젝트 방향
    // var start: (Float, Float) // 시작 위치
    // var offSet: (Float, Float) // 끝 위치
    
    
    // 버튼을 누르면 move+1씩 증가함 -> 홀수 짝수에 따라서 오브젝트의 위치를 바꾸도록 함 -> 나중에 scenNumber에 따라서 바뀌도록 수정해야 함
    //@State var move: Int = 0
    @State var imageNumber: Int = 1
    @State var imageName: String = "" // 여기에 이미지의 이름을 저장
    
    
    // globalStore에 저장되어 있는 값을 가져오기 위함
    @EnvironmentObject var globalStore: GlobalStore
    
    
    // 함수에 오브젝트의 방향과 오브젝트 이름을 받음 -> objectName, makeDirection
    func updateImage(direction: EnumDirection, Name: String) {
        switch direction {
        case .Left:
            imageName = "\(objectName)Left"
        case .Right:
            imageName = "\(objectName)Right"
        case .Front:
            imageName = "\(objectName)Front"
        case .Back_1:
            imageName = "\(objectName)Back_1"
        case .Back_2:
            imageName = "\(objectName)Back_2"
        }
    }
    
    var body: some View {
        
        // Luna의 Image
        VStack{
            Image(imageName)
                .fixedSize()
                .border(.red)
            //.position(x:  CGFloat(start.0) , y: CGFloat(start.1)) // start position
            //.offset(x:  CGFloat(offSet.0) , y: CGFloat(offSet.1)) //end position
            //.animation(Animation.easeInOut(duration: 0.8))
            
            //move가 true이면 위쪽으로 이동하기
            //.animation(.easeOut(duration: 2), value: move)
                .onAppear{
                    print(imageName)
                }
            
            //            Button {
            //                move += 1
            //            } label: {
            //                Text("move the character!")
            //                    .foregroundColor(.black)
            //            }
        }
        .onAppear{
            // .Back_1이거나 Back_2이면 뚜벅뚜벅 효과주기
            if (makeDirection == EnumDirection.Back_1 || makeDirection == EnumDirection.Back_2){
                setTimeIntervalClosure(Count: 0) {
                    if (imageNumber == 1){
                        imageNumber = 2
                        updateImage(direction: .Back_2, Name: objectName)
//                        print(imageNumber)
                    } else {
                        imageNumber = 1
                        updateImage(direction: .Back_1, Name: objectName)
//                        print(imageNumber)
                    }
                }
            }
            else { // 뚜벅 뚜벅 효과를 줄 필요 없을때는 바로 이미지를 만들어준다
                updateImage(direction: makeDirection, Name: objectName)
            }
        }
    }
}
