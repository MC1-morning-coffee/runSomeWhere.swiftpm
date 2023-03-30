//
//  SwiftUIView.swift
//
//
//  Created by Yun Dongbeom on 2023/03/27.
//

import SwiftUI

/*시퀀스 원
 - BigCoffee_Back_1/2 걸음(12걸음 뒤 자동으로 멈춤)
 
 - Object_WaterPurifier 맵과 같이 내려온다.(3000ms, 도착지로부터 y = -650에서 출발)
 
 - Image_Water 팝업
 
 - Image_Water 사라짐
 
 - Quiz 1 나타남 > 이건 여기서 구현?
 
 - Quiz 1 사라짐 > 이건 여기서 구현?
 
 - BigMuho_Side_1/2 걸음(12걸음 뒤 자동으로 멈춤)
 
 */

struct SequenceOneView: View {
    @EnvironmentObject var globalStore: GlobalStore
    @State private var isCharacterMove = false
    
    var body: some View {
        // scriptCount에 따라서 characterView를 바꿔준다
        //        if globalStore.currentScene == .sequence1 {
        //            switch globalStore.scriptCount {
        //            case 0 :
        //                GeometryReader { geo in
        //                    Text("Scene 0 View")
        switch globalStore.scriptCount {
        case 1:
            Text("")
        default:
            Text("")
        }
        CharacterView(objectName: henry.name, makeDirection: EnumDirection.Back_1)
            .position(x: 195, y: 300)
            .offset(y: (isCharacterMove ? 10 : 0))
//            .onTapGesture {
//                withAnimation {
//                    isCharacterMove = true
//                }
//            }
    }
}
                            
//            case 1 :
//                GeometryReader { geo in
//                    CharacterView(objectName: henry.name, makeDirection: EnumDirection.Back_1)
//                        .position(x:  100 , y: 100) // start position
//                        .offset(x:  -20 , y: -20)
//                }
//
//            default:
//                Text("Scene opening View")
//            }
//        }
    


struct SequenceOneView_Previews: PreviewProvider {
    static var previews: some View {
        SequenceOneView()
    }
}
