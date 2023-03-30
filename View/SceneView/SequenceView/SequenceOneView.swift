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
    @State var isPaddleBtnActive = false
    @State private var isCharacterMove = true
    
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
        case 1...11:
            isCharacterMove = false
            print(isCharacterMove)
            print("scriptCount", scriptCount)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                isCharacterMove = true
            }

            print(isCharacterMove)
        default:
            print("scriptCount", scriptCount)
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Text("globalStore.scriptCount: \(globalStore.scriptCount)")
            
            if isCharacterMove {
                CharacterView(objectName: "BigCoffee_", makeDirection: .Back_1, start: (195, 540), end: (0, 0))
            } else {
                EmptyView()
            }
        }
        .onReceive(globalStore.$scriptCount, perform: { currentCount in
            handleSequenceView(scriptCount: currentCount)
        })
        
    }
}

struct SequenceOneView_Previews: PreviewProvider {
    static var previews: some View {
        SequenceOneView()
    }
}
