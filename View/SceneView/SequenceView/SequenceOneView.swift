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
    @State private var isJolJol = false
    @State private var isJolJolMove = false
    @State private var isMuho = false
    
    private func handleSequenceView(scriptCount: Int) {
        switch scriptCount {
        case 1, 4, 5, 6, 10, 11:
            isCharacterMove = false
            print("scriptCount", scriptCount)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                isCharacterMove = true
            }
        case 2: // JolJol 나옴
            isCharacterMove = false
            print("scriptCount", scriptCount)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                isCharacterMove = true
            }
            isJolJolMove = true
        case 3: // JolJol 움직임
            isCharacterMove = false
            isJolJolMove = false
            print("scriptCount", scriptCount)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                isCharacterMove = true
            }
            isJolJol = true
        case 7: // JolJol 없어짐
            isCharacterMove = false
            isJolJol = false
            isJolJolMove = false
            print("scriptCount", scriptCount)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
                isCharacterMove = true
            }
        case 8:
            isMuho = true
        case 9:
            isMuho = false
            
        default:
            print("scriptCount", scriptCount)
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            Text("globalStore.scriptCount: \(globalStore.scriptCount)")
            
            if isCharacterMove {
                CharacterView(objectName: "BigCoffee_", makeDirection: .Back_1, start: (195, 540), end: (0, 0))
            }
            
            if isJolJol {
                JolJolView(start: (195, 150), end: (0, 0), imageOffset: true)
            }
            if isJolJolMove {
                JolJolView(start: (195, 150), end: (0, -150), imageOffset: true)
            }
            if isMuho {
                CharacterView(objectName: "BigMuho_", makeDirection: .Side_1, start: (0, 440), end: (100, 0))
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
